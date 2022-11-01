import 'dart:convert';
import 'package:about_flutter_clean_architecture/data/photo_api_repository.dart';
import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
  static const String baseUrl = 'https://pixabay.com/api/';
  static const String apiKey = '24999262-d78d2a61a8beebcf2664f2cde';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    //client 가 null 이면 http.Client() 할당
    client ??= http.Client();

    final res = await client.get(Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo'));
    Map<String, dynamic> jsonRes = jsonDecode(res.body);
    Iterable hits = jsonRes['hits']; //Iterable로 받아서 반복 처리 용이
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
