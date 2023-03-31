import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pod_player_new/pod_player_new.dart';
import 'package:yt_play/pages/video_player/description/description_view.dart';
import 'package:yt_play/pages/video_player/video_player_consts.dart';
import 'package:yt_play/pages/video_player/video_player_shimmer.dart';
import 'package:yt_play/utils/mini_player_store.dart';
import 'package:yt_play/utils/widgets/outlined_button_widget.dart';
import 'package:yt_play/service_locator.dart';
import 'package:yt_play/utils/video_details/video_view.dart';

class VideoPlayerView extends StatefulWidget {
  final GlobalKey keyPlayer;
  const VideoPlayerView({Key? key, required this.keyPlayer}) : super(key: key);

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  final miniPlayStore = getIt<MiniPlayerStore>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Observer(builder: (context) {
          return Column(
            children: [
              PodVideoPlayer(
                key: widget.keyPlayer,
                controller: miniPlayStore.playerController,
                podPlayerLabels: const PodPlayerLabels(
                    quality: VideoPlayerConsts.qualityText,
                    loopVideo: VideoPlayerConsts.loopVideText,
                    optionEnabled: VideoPlayerConsts.optionEnabledText,
                    optionDisabled: VideoPlayerConsts.optionDisabledText,
                    playbackSpeed: VideoPlayerConsts.playbackSpeedText,
                    error: VideoPlayerConsts.errorText),
              ),
              miniPlayStore.loadingRelated
                  ? const VideoPlayerShimmer()
                  : Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            miniPlayStore.titleVideo,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButtonWidget(
                                  label: miniPlayStore.authorVideo,
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButtonWidget(
                                  icon: Icons.description_outlined,
                                  label: VideoPlayerConsts.descriptionText,
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const DescriptionView();
                                        });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              miniPlayStore.isSavedVideo
                                  ? OutlinedButtonWidget(
                                      icon: Icons.check_outlined,
                                      label: VideoPlayerConsts.savedText,
                                      onTap: () {
                                        miniPlayStore.removeSavedVideo();
                                      },
                                    )
                                  : OutlinedButtonWidget(
                                      icon: Icons.bookmark_border_outlined,
                                      label: VideoPlayerConsts.saveText,
                                      onTap: () {
                                        miniPlayStore.saveVideo();
                                      },
                                    ),
                              const SizedBox(
                                width: 4,
                              ),
                              OutlinedButtonWidget(
                                icon: Icons.download,
                                label: VideoPlayerConsts.downloadText,
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 48,
                            child: SwitchListTile(
                              title: const Text(VideoPlayerConsts.autoPlayText,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              value: miniPlayStore.nextAutoPlay,
                              onChanged: (_) {
                                miniPlayStore.nextAutoPlay =
                                    !miniPlayStore.nextAutoPlay;
                              },
                              activeColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 -
                    kBottomNavigationBarHeight * 2,
                child: Observer(builder: (_) {
                  return miniPlayStore.loadingRelated
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : VideoView(video: miniPlayStore.videoRelated);
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
