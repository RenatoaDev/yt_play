import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  PageController pageController = PageController();

  @observable
  int indexPage = 0;

  @action
  void setIndexPage(int index) {
    pageController.jumpToPage(index);
    indexPage = index;
  }
}
