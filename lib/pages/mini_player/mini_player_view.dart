import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:pod_player_new/pod_player_new.dart';
import 'package:yt_play/pages/video_player/video_player_view.dart';
import 'package:yt_play/service_locator.dart';
import 'package:yt_play/utils/mini_player_store.dart';

final _player = GlobalKey();
final miniPlayStore = getIt<MiniPlayerStore>();

class MiniPlayerView extends StatelessWidget {
  const MiniPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Offstage(
        offstage: !miniPlayStore.playActive,
        child: SafeArea(
          top: true,
          child: Miniplayer(
            curve: Curves.easeIn,
            backgroundColor: const Color(0xff363432),
            controller: miniPlayStore.controller,
            minHeight: 70,
            maxHeight: MediaQuery.of(context).size.height,
            builder: (height, percentage) {
              return miniPlayStore.playActive
                  ? percentage > 0.20
                      ? VideoPlayerView(keyPlayer: _player)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                ),
                                Positioned(
                                  left: MediaQuery.of(context).size.width / 4,
                                  bottom: 10,
                                  right: 0,
                                  child: Observer(builder: (context) {
                                    return miniPlayStore.titleVideo.isEmpty
                                        ? const CircularProgressIndicator()
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        miniPlayStore
                                                            .titleVideo,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text(
                                                        miniPlayStore
                                                            .authorVideo,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: miniPlayStore
                                                          .playerPlayPause,
                                                      icon: miniPlayStore
                                                              .playPause
                                                          ? const Icon(
                                                              Icons.pause)
                                                          : const Icon(
                                                              Icons.play_arrow),
                                                    ),
                                                    IconButton(
                                                      onPressed: miniPlayStore
                                                          .playerClose,
                                                      icon: const Icon(
                                                          Icons.close),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                  }),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: percentage > 0.20
                                          ? MediaQuery.of(context).size.width
                                          : null,
                                      height: height - 5,
                                      child: PodVideoPlayer(
                                          key: _player,
                                          overlayBuilder: (options) =>
                                              Container(),
                                          controller:
                                              miniPlayStore.playerController,
                                          alwaysShowProgressBar: false,
                                          onVideoError: () => Container()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                              width: double.maxFinite,
                              child: PodProgressBar(
                                tag: miniPlayStore.playerController.getTag,
                                podProgressBarConfig:
                                    const PodProgressBarConfig(
                                        circleHandlerRadius: 0.0),
                              ),
                            ),
                          ],
                        )
                  : const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  }
}
