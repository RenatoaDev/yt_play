// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yt_play/pages/history/history_view.dart';
import 'package:yt_play/pages/saved/saved_videos_view.dart';

class MenuPageView extends StatelessWidget {
  const MenuPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff363432),
        title: const Text('Menu'),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HistoryView()));
            },
            child: const ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: Text('Histórico'),
            ),
          ),
          Divider(
            height: 1,
          ),
          const ListTile(
            leading: Icon(
              Icons.download,
              color: Colors.black,
            ),
            title: Text(
              'Downloads',
            ),
          ),
          Divider(
            height: 1,
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SavedVideosView()));
            }),
            child: ListTile(
              leading: Icon(
                Icons.subscriptions_outlined,
                color: Colors.black,
              ),
              title: Text('Salvos'),
            ),
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
