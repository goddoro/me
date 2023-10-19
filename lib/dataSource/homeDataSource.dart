import 'dart:convert';
import '../entity/medium.dart';
import 'package:http/http.dart' as http;

class HomeDataSource {
  Future<List<Medium>> getMediumArticles() async {
    final response = await http
        .get(Uri.parse('http://3.35.8.235:3000/medium'));
    return jsonDecode(response.body)
        .map<Medium>((json) => Medium.fromJson(json))
        .toList();
  }
}