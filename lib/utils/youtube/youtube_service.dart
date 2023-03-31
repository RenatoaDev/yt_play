// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import 'package:yt_play/utils/youtube/models/video.dart';
import 'package:yt_play/utils/youtube/models/video_data.dart';
import 'package:yt_play/utils/youtube/models/video_page.dart';
import 'package:yt_play/utils/youtube/utils/extension.dart';
import 'package:yt_play/utils/youtube/utils/extract_json.dart';

class YoutubeService {
  Future<VideoData?> fetchVideoData(String videoId) async {
    VideoData? videoData;
    var client = http.Client();
    var response =
        await client.get(Uri.parse('https://www.youtube.com/watch?v=$videoId'));
    var raw = response.body;
    var root = parser.parse(raw);
    final scriptText = root
        .querySelectorAll('script')
        .map((e) => e.text)
        .toList(growable: false);
    var initialData =
        scriptText.firstWhereOrNull((e) => e.contains('var ytInitialData = '));
    initialData ??= scriptText
        .firstWhereOrNull((e) => e.contains('window["ytInitialData"] ='));
    var jsonMap = extractJson(initialData!);
    if (jsonMap != null) {
      var contents = jsonMap.get('contents')?.get('twoColumnWatchNextResults');

      var contentList = contents
          ?.get('secondaryResults')
          ?.get('secondaryResults')
          ?.getList('results')
          ?.toList();

      List<Video> videosList = [];

      contentList?.forEach((element) {
        if (element['compactVideoRenderer']?['title']?['simpleText'] != null) {
          Video video = Video.fromMap(element);
          videosList.add(video);
        }
      });

      videoData = VideoData(
          video: VideoPage.fromMap(contents, videoId), videosList: videosList);
    }
    return videoData;
  }

  Future<List<Video>> fetchTrendingVideo() async {
    List<Video> list = [];
    var client = http.Client();
    var response = await client.get(
      Uri.parse(
        'https://www.youtube.com/feed/trending',
      ),
    );
    var raw = response.body;
    var root = parser.parse(raw);
    final scriptText = root
        .querySelectorAll('script')
        .map((e) => e.text)
        .toList(growable: false);
    var initialData =
        scriptText.firstWhereOrNull((e) => e.contains('var ytInitialData = '));
    initialData ??= scriptText
        .firstWhereOrNull((e) => e.contains('window["ytInitialData"] ='));
    var jsonMap = extractJson(initialData!);
    if (jsonMap != null) {
      var contents = jsonMap
          .get('contents')
          ?.get('twoColumnBrowseResultsRenderer')
          ?.getList('tabs')
          ?.firstOrNull
          ?.get('tabRenderer')
          ?.get('content')
          ?.get('sectionListRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('itemSectionRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('shelfRenderer')
          ?.get('content')
          ?.get('expandedShelfContentsRenderer')
          ?.getList('items');
      var firstList = contents != null ? contents.toList() : [];
      var secondContents = jsonMap
          .get('contents')
          ?.get('twoColumnBrowseResultsRenderer')
          ?.getList('tabs')
          ?.firstOrNull
          ?.get('tabRenderer')
          ?.get('content')
          ?.get('sectionListRenderer')
          ?.getList('contents')
          ?.elementAtSafe(3)
          ?.get('itemSectionRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('shelfRenderer')
          ?.get('content')
          ?.get('expandedShelfContentsRenderer')
          ?.getList('items');
      var secondList = secondContents != null ? secondContents.toList() : [];
      var contentList = [...firstList, ...secondList];
      for (var element in contentList) {
        Video video = Video.fromMap(element);
        list.add(video);
      }
    }
    return list;
  }

  Future<List<Video>> fetchTrendingMusic() async {
    String params = "4gINGgt5dG1hX2NoYXJ0cw%3D%3D";
    List<Video> list = [];
    var client = http.Client();
    var response = await client.get(
      Uri.parse(
        'https://www.youtube.com/feed/trending?bp=$params',
      ),
    );
    var raw = response.body;
    var root = parser.parse(raw);
    final scriptText = root
        .querySelectorAll('script')
        .map((e) => e.text)
        .toList(growable: false);
    var initialData =
        scriptText.firstWhereOrNull((e) => e.contains('var ytInitialData = '));
    initialData ??= scriptText
        .firstWhereOrNull((e) => e.contains('window["ytInitialData"] ='));
    var jsonMap = extractJson(initialData!);
    if (jsonMap != null) {
      var contents = jsonMap
          .get('contents')
          ?.get('twoColumnBrowseResultsRenderer')
          ?.getList('tabs')
          ?.elementAtSafe(1)
          ?.get('tabRenderer')
          ?.get('content')
          ?.get('sectionListRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('itemSectionRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('shelfRenderer')
          ?.get('content')
          ?.get('expandedShelfContentsRenderer')
          ?.getList('items');
      var contentList = contents != null ? contents.toList() : [];
      for (var element in contentList) {
        Video video = Video.fromMap(element);
        list.add(video);
      }
    }
    return list;
  }

  ///Get list of trending gaming videos on youtube
  Future<List<Video>> fetchTrendingGaming() async {
    String params = "4gIcGhpnYW1pbmdfY29ycHVzX21vc3RfcG9wdWxhcg";
    List<Video> list = [];
    var client = http.Client();
    var response = await client.get(
      Uri.parse(
        'https://www.youtube.com/feed/trending?bp=$params',
      ),
    );
    var raw = response.body;
    var root = parser.parse(raw);
    final scriptText = root
        .querySelectorAll('script')
        .map((e) => e.text)
        .toList(growable: false);
    var initialData =
        scriptText.firstWhereOrNull((e) => e.contains('var ytInitialData = '));
    initialData ??= scriptText
        .firstWhereOrNull((e) => e.contains('window["ytInitialData"] ='));
    var jsonMap = extractJson(initialData!);
    if (jsonMap != null) {
      var contents = jsonMap
          .get('contents')
          ?.get('twoColumnBrowseResultsRenderer')
          ?.getList('tabs')
          ?.elementAtSafe(2)
          ?.get('tabRenderer')
          ?.get('content')
          ?.get('sectionListRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('itemSectionRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('shelfRenderer')
          ?.get('content')
          ?.get('expandedShelfContentsRenderer')
          ?.getList('items');
      var contentList = contents != null ? contents.toList() : [];

      for (var element in contentList) {
        Video video = Video.fromMap(element);
        list.add(video);
      }
    }
    return list;
  }

  Future<List<Video>> fetchTrendingMovies() async {
    String params = "4gIKGgh0cmFpbGVycw%3D%3D";
    List<Video> list = [];
    var client = http.Client();
    var response = await client.get(
      Uri.parse(
        'https://www.youtube.com/feed/trending?bp=$params',
      ),
    );
    var raw = response.body;
    var root = parser.parse(raw);
    final scriptText = root
        .querySelectorAll('script')
        .map((e) => e.text)
        .toList(growable: false);
    var initialData =
        scriptText.firstWhereOrNull((e) => e.contains('var ytInitialData = '));
    initialData ??= scriptText
        .firstWhereOrNull((e) => e.contains('window["ytInitialData"] ='));
    var jsonMap = extractJson(initialData!);
    if (jsonMap != null) {
      var contents = jsonMap
          .get('contents')
          ?.get('twoColumnBrowseResultsRenderer')
          ?.getList('tabs')
          ?.elementAtSafe(3)
          ?.get('tabRenderer')
          ?.get('content')
          ?.get('sectionListRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('itemSectionRenderer')
          ?.getList('contents')
          ?.firstOrNull
          ?.get('shelfRenderer')
          ?.get('content')
          ?.get('expandedShelfContentsRenderer')
          ?.getList('items');
      var contentList = contents != null ? contents.toList() : [];
      for (var element in contentList) {
        Video video = Video.fromMap(element);
        list.add(video);
      }
    }
    return list;
  }
}
