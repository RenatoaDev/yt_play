import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:yt_play/pages/history/history_store.dart';
import 'package:yt_play/service_locator.dart';
import 'package:yt_play/utils/mini_player_store.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HistoryStore store = HistoryStore();
    final miniPlayStore = getIt<MiniPlayerStore>();
    store.getHistoryVideo();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
        backgroundColor: const Color(0xff363432),
      ),
      body: Observer(builder: (context) {
        return ListView.builder(
          itemCount: store.videoDetails.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    miniPlayStore.urlImgVideo =
                        store.videoDetails[index].thumbnail ?? '';
                    miniPlayStore.controller
                        .animateToHeight(state: PanelState.MAX);
                    miniPlayStore.playVideo(store.videoDetails[index].id ?? '');
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                    minVerticalPadding: 0,
                    title: Text(
                      store.videoDetails[index].title.toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      store.videoDetails[index].author.toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Image.network(
                      store.videoDetails[index].thumbnail ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Colors.black45,
                ),
              ],
            );
          }),
        );
      }),
    );
  }
}
