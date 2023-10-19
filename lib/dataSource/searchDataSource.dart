import 'package:goddoro/database.dart';

import '../entity/friend.dart';

class SearchDataSource {
  DBHelper dbHelper = DBHelper();
  
  Future<List<Friend>> getFriendList() async {
    return await dbHelper.getAllFriend();
  }

  addFriend(String name) async {
    await dbHelper.insertFriend(Friend(id: 0, name: name));
  }
}