import 'dart:convert';
import 'package:miniplayer/miniplayer.dart';
import 'package:mobx/mobx.dart';
import 'package:pod_player_new/pod_player_new.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yt_play/utils/video_details/video_details.dart';
import 'package:yt_play/utils/youtube/youtube_service.dart';
import 'package:yt_play/utils/youtube/models/video.dart' as data;
part 'mini_player_store.g.dart';

class MiniPlayerStore = MiniPlayerStoreBase with _$MiniPlayerStore;

abstract class MiniPlayerStoreBase with Store {
  final MiniplayerController controller = MiniplayerController();

  late PodPlayerController playerController = PodPlayerController(
    playVideoFrom: PlayVideoFrom.youtube(''),
  );

  @observable
  String url = '';

  @observable
  double videoProgress = 0;

  @observable
  double videoProgressTotal = 0;

  @observable
  bool playActive = false;

  @observable
  String idVideo = '';

  @observable
  String titleVideo = '';

  @observable
  String authorVideo = '';

  @observable
  String viewCountVideo = '';

  @observable
  String likeCountVideo = '';

  @observable
  String dateVideo = '';

  @observable
  String descriptionVideo = '';

  @observable
  String urlImgVideo = '';

  @observable
  bool playPause = false;

  String nextVideoId = '';
  String nextImg = '';

  ObservableList<data.Video> videoRelated = ObservableList();

  @observable
  bool loadingRelated = true;

  @observable
  bool nextAutoPlay = true;

  @observable
  bool isSavedVideo = false;

  @action
  playVideo(String videoId) {
    playerController
        .changeVideo(
            playVideoFrom: PlayVideoFrom.youtube(videoId),
            playerConfig: const PodPlayerConfig())
        .then((value) {
      playerController.addListener(() {
        if (playerController.videoState.name == 'playing') {
          if (playerController.videoPlayerValue!.position.inSeconds ==
              playerController.videoPlayerValue!.duration.inSeconds - 1) {
            if (nextAutoPlay && !playerController.isVideoLooping) {
              urlImgVideo = nextImg;
              playVideo(nextVideoId);
            }
          }
        }
      });
    });

    playActive = true;
    playPause = true;
    loadingRelated = true;
    getVideoInfo(videoId);
  }

  getVideoInfo(String videoId) async {
    await YoutubeService().fetchVideoData(videoId).then((data) {
      var video = data?.video;
      idVideo = video?.videoId ?? '';
      titleVideo = video?.title ?? '';
      authorVideo = video?.channelName ?? '';
      viewCountVideo = video?.viewCount ?? '';
      dateVideo = video?.date ?? '';
      descriptionVideo = video?.description ?? '';
      likeCountVideo = video?.likeCount ?? '';

      if (data?.videosList != null) {
        videoRelated.clear();
        videoRelated.addAll(data?.videosList ?? []);
        nextVideoId = data?.videosList.first.videoId ?? '';
        nextImg = data?.videosList.first.thumbnails?.first.url ?? '';
        loadingRelated = false;
      }

      addHistoryVideo();
      checkVideoSaved();
    });
  }

  @action
  playerPlayPause() {
    playerController.togglePlayPause();
    playPause = playerController.isVideoPlaying;
  }

  @action
  playerClose() {
    playerController.changeVideo(playVideoFrom: PlayVideoFrom.youtube(''));
    playActive = false;
  }

  saveVideo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedVideos = prefs.getString('savedList');

    VideoDetails videoDetails = VideoDetails(
        id: idVideo,
        title: titleVideo,
        thumbnail: urlImgVideo,
        author: authorVideo);

    if (savedVideos != null) {
      List<VideoDetails> videoDetailsList =
          List<Map<String, dynamic>>.from(json.decode(savedVideos))
              .map((e) => VideoDetails.fromJson(e))
              .toList();

      videoDetailsList.add(videoDetails);
      String videoDetailsString = json.encode(videoDetailsList);

      prefs.setString('savedList', videoDetailsString);
    } else {
      List<Map<String, dynamic>> videoDetailsToList = [videoDetails.toJson()];
      String videoDetailsString = json.encode(videoDetailsToList);
      prefs.setString('savedList', videoDetailsString);
    }
    isSavedVideo = true;
  }

  addHistoryVideo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? historyVideos = prefs.getString('history');

    VideoDetails videoDetails = VideoDetails(
        id: idVideo,
        title: titleVideo,
        thumbnail: urlImgVideo,
        author: authorVideo);

    if (historyVideos != null) {
      List<VideoDetails> historyVideoList =
          List<Map<String, dynamic>>.from(json.decode(historyVideos))
              .map((e) => VideoDetails.fromJson(e))
              .toList();

      if (historyVideoList.length >= 100) {
        historyVideoList.removeAt(0);
      }

      historyVideoList.removeWhere((element) => element.id == idVideo);

      historyVideoList.add(videoDetails);
      String historyVideoString = json.encode(historyVideoList);

      prefs.setString('history', historyVideoString);
    } else {
      List<Map<String, dynamic>> historyVideoList = [videoDetails.toJson()];
      String historyVideoString = json.encode(historyVideoList);
      prefs.setString('history', historyVideoString);
    }
  }

  @action
  checkVideoSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedVideos = prefs.getString('savedList');

    if (savedVideos != null) {
      if (savedVideos.contains(idVideo)) {
        isSavedVideo = true;
      } else {
        isSavedVideo = false;
      }
    }
  }

  removeSavedVideo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedVideos = prefs.getString('savedList');
    if (savedVideos != null) {
      List<VideoDetails> videoDetailsList =
          List<Map<String, dynamic>>.from(json.decode(savedVideos))
              .map((e) => VideoDetails.fromJson(e))
              .toList();
      videoDetailsList.removeWhere((element) => element.id == idVideo);
      String videoDetailsString = json.encode(videoDetailsList);

      prefs.setString('savedList', videoDetailsString);

      isSavedVideo = false;
    }
  }
}
