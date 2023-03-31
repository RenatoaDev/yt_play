import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yt_play/pages/video_player/video_player_consts.dart';
import 'package:yt_play/utils/mini_player_store.dart';
import 'package:yt_play/service_locator.dart';

class DescriptionView extends StatefulWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  final miniPlayStore = getIt<MiniPlayerStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          VideoPlayerConsts.descriptionText,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.close_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          child: Observer(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${VideoPlayerConsts.likeText} ${miniPlayStore.likeCountVideo}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    "${VideoPlayerConsts.viewText} ${miniPlayStore.viewCountVideo}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    "${VideoPlayerConsts.dateText} ${miniPlayStore.dateVideo}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(miniPlayStore.descriptionVideo),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
