import 'dart:convert';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const String baseUrl = 'https://pixabay.com/api/';
  static const String apiKey = '24999262-d78d2a61a8beebcf2664f2cde';

  Future<Iterable> fetch(String query) async {
    final response = await client.get(Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo'));
    Map<String, dynamic> jsonRes = jsonDecode(response.body);
    Iterable hits = jsonRes['hits']; //Iterable로 받아서 반복 처리 용이
    return hits;
  }
}
