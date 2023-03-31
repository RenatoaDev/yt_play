import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:yt_play/utils/youtube/models/video.dart' as data;
import 'package:yt_play/utils/app_extension.dart';
part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  TextEditingController searchTextController = TextEditingController();

  @observable
  bool loading = true;

  @observable
  List<data.Video> searchList = [];

  @observable
  String searchText = '';

  @observable
  bool noResearch = true;

  @action
  getSearch(String value) async {
    if (value.isNotEmpty) {
      loading = true;
      noResearch = false;
      searchList.clear();
      var yt = YoutubeExplode();
      VideoSearchList video = await yt.search.search(value);

      for (var item in video) {
        searchList.add(item.toVideo);
      }
      loading = false;
    }
  }
}
