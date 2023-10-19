
import '../dataSource/searchDataSource.dart';
import '../entity/friend.dart';

class SearchRepository {
  final SearchDataSource _dataSource = SearchDataSource();

  Future<List<Friend>> getFriendList() {
    return _dataSource.getFriendList();
  }

  addFriend(String name) {
    _dataSource.addFriend(name);
  }
}