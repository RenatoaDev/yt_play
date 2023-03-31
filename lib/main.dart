import 'package:flutter/material.dart';
import 'package:yt_play/pages/home/home_page_view.dart';
import 'package:yt_play/service_locator.dart';

Future<void> main() async {
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YT Play',
      home: HomePageView(),
    );
  }
}
