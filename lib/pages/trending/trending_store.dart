import 'package:mobx/mobx.dart';
import 'package:yt_play/utils/youtube/models/video.dart';
import 'package:yt_play/utils/youtube/youtube_service.dart';
part 'trending_store.g.dart';

class TrendingStore = TrendingStoreBase with _$TrendingStore;

abstract class TrendingStoreBase with Store {
  YoutubeService youtubeService = YoutubeService();

  @observable
  List<Video> trendingVideo = [];

  @observable
  List<Video> trendingMusic = [];

  @observable
  List<Video> trendingGaming = [];

  @observable
  List<Video> trendingMovies = [];

  @observable
  bool loading = true;

  @action
  getTrending() async {
    trendingVideo = await youtubeService.fetchTrendingVideo();
    trendingMusic = await youtubeService.fetchTrendingMusic();
    trendingGaming = await youtubeService.fetchTrendingGaming();
    trendingMovies = await youtubeService.fetchTrendingMovies();
    loading = false;
  }
}
