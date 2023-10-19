import 'package:flutter/material.dart';

import '../entity/medium.dart';
import '../repository/homeRepository.dart';

class HomeViewModel with ChangeNotifier {
  late final HomeRepository _homeRepository;

  List<Medium> get items => _items;
  List<Medium> _items = [];

  HomeViewModel() {
    _homeRepository = HomeRepository();
    _loadItems();
  }

  Future<void> _loadItems() async {
    _items = await _homeRepository.getMediumList();
    notifyListeners();
  }
}