
import 'package:flutter/cupertino.dart';

import '../entity/friend.dart';
import '../entity/medium.dart';
import '../repository/homeRepository.dart';
import '../repository/searchRepository.dart';

class SearchViewModel with ChangeNotifier {
  late final SearchRepository _searchRepository;

  List<Friend> get items => _items;
  List<Friend> _items = [];

  SearchViewModel() {
    _searchRepository = SearchRepository();
  }

  Future<void> loadFriends() async {
    _items = await _searchRepository.getFriendList();
    notifyListeners();
  }

  addFriend(String name) async {
    await _searchRepository.addFriend(name);
    notifyListeners();
  }
}