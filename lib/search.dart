import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goddoro/search/searchViewModel.dart';
import 'package:provider/provider.dart';

import 'entity/friend.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late List<Friend> friendList;
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<SearchViewModel>(
      builder: (context, provider, child) {
        friendList = provider.items;
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              const Text("Hello World"),
              Column(children: [
                TextField(
                    onChanged: (String text) {
                      inputText = text;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'My Friend',
                    )),
                ElevatedButton(
                    onPressed: () {
                      provider.addFriend(inputText);
                      Fluttertoast.showToast(
                          msg: "Friend add completed",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: const Text("Search"))
              ])
            ],
          ),
        );
      },
    ));
  }
}
