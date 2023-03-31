import 'package:yt_play/utils/youtube/models/video.dart';
import 'package:yt_play/utils/youtube/models/video_page.dart';

class VideoData {
  VideoPage? video;
  List<Video> videosList;

  VideoData({this.video, required this.videosList});
}
