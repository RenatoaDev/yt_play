import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yt_play/pages/search/search_store.dart';
import 'package:yt_play/utils/video_details/video_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with AutomaticKeepAliveClientMixin<SearchView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SearchStore searchStore = SearchStore();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff363432),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 60.0,
        title: TextField(
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: searchStore.searchTextController,
          textInputAction: TextInputAction.search,
          onSubmitted: searchStore.getSearch,
          onChanged: (value) => searchStore.searchText = value,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.white),
              hintText: " Pesquisar...",
              border: InputBorder.none,
              suffixIcon: Observer(
                  builder: (_) => IconButton(
                        icon: searchStore.searchText.isEmpty
                            ? Container()
                            : const Icon(Icons.highlight_off_outlined),
                        color: Colors.white,
                        onPressed: () {
                          searchStore.searchTextController.text = '';
                          searchStore.searchText = '';
                        },
                      ))),
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      ),
      body: Observer(
        builder: (_) => searchStore.noResearch
            ? Container()
            : searchStore.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : VideoView(video: searchStore.searchList),
      ),
    );
  }
}
