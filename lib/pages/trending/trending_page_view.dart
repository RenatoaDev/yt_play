import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yt_play/pages/trending/trending_consts.dart';
import 'package:yt_play/pages/trending/trending_store.dart';
import 'package:yt_play/utils/video_details/video_view.dart';

class TrendingPageView extends StatefulWidget {
  const TrendingPageView({Key? key}) : super(key: key);

  @override
  State<TrendingPageView> createState() => _TrendingPageViewState();
}

class _TrendingPageViewState extends State<TrendingPageView>
    with AutomaticKeepAliveClientMixin<TrendingPageView> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    TrendingStore trendingStore = TrendingStore();
    trendingStore.getTrending();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff363432),
          title: const Text(TrendingConsts.appBarText),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(TrendingConsts.tabVideoText),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(TrendingConsts.tabMusicText),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(TrendingConsts.tabGameText),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  TrendingConsts.tabMovieText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        body: Observer(
          builder: (_) => trendingStore.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(
                  children: [
                    VideoView(video: trendingStore.trendingVideo),
                    VideoView(video: trendingStore.trendingMusic),
                    VideoView(video: trendingStore.trendingGaming),
                    VideoView(video: trendingStore.trendingMovies),
                  ],
                ),
        ),
      ),
    );
  }
}
