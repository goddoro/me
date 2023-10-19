import 'package:goddoro/dataSource/homeDataSource.dart';

import '../entity/medium.dart';

class HomeRepository {
  final HomeDataSource _dataSource = HomeDataSource();

  Future<List<Medium>> getMediumList() {
    return _dataSource.getMediumArticles();
  }
}