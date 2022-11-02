import 'dart:convert';

import 'package:about_flutter_clean_architecture/data/data_source/result.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const String baseUrl = 'https://pixabay.com/api/';
  static const String apiKey = '24999262-d78d2a61a8beebcf2664f2cde';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client.get(Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo'));
      Map<String, dynamic> jsonRes = jsonDecode(response.body);
      Iterable hits = jsonRes['hits']; //Iterable로 받아서 반복 처리 용이
      //sealed class에 데이터를 담아서 넘김
      return Result.success(hits);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
