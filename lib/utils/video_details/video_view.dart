import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:yt_play/service_locator.dart';
import 'package:yt_play/utils/mini_player_store.dart';
import 'package:yt_play/utils/youtube/models/video.dart';

class VideoView extends StatefulWidget {
  final List<Video> video;
  const VideoView({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  final miniPlayStore = getIt<MiniPlayerStore>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
              children: widget.video.map((item) {
            return item.title == null
                ? Container()
                : GestureDetector(
                    onTap: () {
                      miniPlayStore.urlImgVideo =
                          item.thumbnails?.last.url.toString() ?? '';
                      miniPlayStore.controller
                          .animateToHeight(state: PanelState.MAX);
                      miniPlayStore.playVideo(item.videoId ?? '');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          item.thumbnails?.last.url.toString() ?? '',
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                '${item.channelName} • ${item.views}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
          }).toList())),
    );
  }
}
