// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TrendingStore on TrendingStoreBase, Store {
  late final _$trendingVideoAtom =
      Atom(name: 'TrendingStoreBase.trendingVideo', context: context);

  @override
  List<Video> get trendingVideo {
    _$trendingVideoAtom.reportRead();
    return super.trendingVideo;
  }

  @override
  set trendingVideo(List<Video> value) {
    _$trendingVideoAtom.reportWrite(value, super.trendingVideo, () {
      super.trendingVideo = value;
    });
  }

  late final _$trendingMusicAtom =
      Atom(name: 'TrendingStoreBase.trendingMusic', context: context);

  @override
  List<Video> get trendingMusic {
    _$trendingMusicAtom.reportRead();
    return super.trendingMusic;
  }

  @override
  set trendingMusic(List<Video> value) {
    _$trendingMusicAtom.reportWrite(value, super.trendingMusic, () {
      super.trendingMusic = value;
    });
  }

  late final _$trendingGamingAtom =
      Atom(name: 'TrendingStoreBase.trendingGaming', context: context);

  @override
  List<Video> get trendingGaming {
    _$trendingGamingAtom.reportRead();
    return super.trendingGaming;
  }

  @override
  set trendingGaming(List<Video> value) {
    _$trendingGamingAtom.reportWrite(value, super.trendingGaming, () {
      super.trendingGaming = value;
    });
  }

  late final _$trendingMoviesAtom =
      Atom(name: 'TrendingStoreBase.trendingMovies', context: context);

  @override
  List<Video> get trendingMovies {
    _$trendingMoviesAtom.reportRead();
    return super.trendingMovies;
  }

  @override
  set trendingMovies(List<Video> value) {
    _$trendingMoviesAtom.reportWrite(value, super.trendingMovies, () {
      super.trendingMovies = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'TrendingStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$getTrendingAsyncAction =
      AsyncAction('TrendingStoreBase.getTrending', context: context);

  @override
  Future getTrending() {
    return _$getTrendingAsyncAction.run(() => super.getTrending());
  }

  @override
  String toString() {
    return '''
trendingVideo: ${trendingVideo},
trendingMusic: ${trendingMusic},
trendingGaming: ${trendingGaming},
trendingMovies: ${trendingMovies},
loading: ${loading}
    ''';
  }
}
