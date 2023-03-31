import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yt_play/utils/video_details/video_details.dart';
part 'history_store.g.dart';

class HistoryStore = HistoryStoreBase with _$HistoryStore;

abstract class HistoryStoreBase with Store {
  ObservableList<VideoDetails> videoDetails = ObservableList();

  @action
  getHistoryVideo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? historyVideos = prefs.getString('history');

    if (historyVideos != null) {
      List<VideoDetails> historyList =
          List<Map<String, dynamic>>.from(json.decode(historyVideos))
              .map((e) => VideoDetails.fromJson(e))
              .toList();

      videoDetails.addAll(historyList.reversed);
    }
  }
}
