import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yt_play/utils/mini_player_store.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<MiniPlayerStore>(() => MiniPlayerStore());

  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());
}
