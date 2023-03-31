import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:yt_play/pages/home/home_store.dart';
import 'package:yt_play/pages/menu/menu_page_view.dart';
import 'package:yt_play/pages/mini_player/mini_player_view.dart';
import 'package:yt_play/pages/search/search_view.dart';
import 'package:yt_play/pages/trending/trending_page_view.dart';
import 'package:yt_play/service_locator.dart';

final GlobalKey<NavigatorState> _navigatorKey = getIt();
final controller = HomeStore();

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Navigator(
            key: _navigatorKey,
            onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
              settings: settings,
              builder: (BuildContext context) => PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: const [
                  TrendingPageView(),
                  SearchView(),
                  MenuPageView(),
                ],
              ),
            ),
          ),
          const MiniPlayerView(),
        ],
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          currentIndex: controller.indexPage,
          selectedItemColor: const Color(0xff363432),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.house_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: 'Pesquisar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets_outlined), label: 'Menu')
          ],
          onTap: (value) {
            _navigatorKey.currentState!.popUntil((route) => route.isFirst);
            miniPlayStore.controller.animateToHeight(state: PanelState.MIN);
            controller.setIndexPage(value);
          },
        ),
      ),
    );
  }
}
