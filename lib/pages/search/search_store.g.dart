// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on SearchStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: 'SearchStoreBase.loading', context: context);

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

  late final _$searchListAtom =
      Atom(name: 'SearchStoreBase.searchList', context: context);

  @override
  List<data.Video> get searchList {
    _$searchListAtom.reportRead();
    return super.searchList;
  }

  @override
  set searchList(List<data.Video> value) {
    _$searchListAtom.reportWrite(value, super.searchList, () {
      super.searchList = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: 'SearchStoreBase.searchText', context: context);

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$noResearchAtom =
      Atom(name: 'SearchStoreBase.noResearch', context: context);

  @override
  bool get noResearch {
    _$noResearchAtom.reportRead();
    return super.noResearch;
  }

  @override
  set noResearch(bool value) {
    _$noResearchAtom.reportWrite(value, super.noResearch, () {
      super.noResearch = value;
    });
  }

  late final _$getSearchAsyncAction =
      AsyncAction('SearchStoreBase.getSearch', context: context);

  @override
  Future getSearch(String value) {
    return _$getSearchAsyncAction.run(() => super.getSearch(value));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
searchList: ${searchList},
searchText: ${searchText},
noResearch: ${noResearch}
    ''';
  }
}
