import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yt_play/utils/video_details/video_details.dart';
part 'saved_videos_store.g.dart';

class SavedVideosStore = SavedVideosStoreBase with _$SavedVideosStore;

abstract class SavedVideosStoreBase with Store {
  ObservableList<VideoDetails> videoDetails = ObservableList();

  @action
  getSavedVideos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedVideos = prefs.getString('savedList');

    if (savedVideos != null) {
      List<VideoDetails> videoDetailsList =
          List<Map<String, dynamic>>.from(json.decode(savedVideos))
              .map((e) => VideoDetails.fromJson(e))
              .toList();

      videoDetails.addAll(videoDetailsList.reversed);
    }
  }
}
