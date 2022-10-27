import 'dart:convert';
import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetch(String query) async {
  const apiKey = '24999262-d78d2a61a8beebcf2664f2cde';
  final res = await http.get(Uri.parse('https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo'));
  Map<String, dynamic> jsonRes = jsonDecode(res.body);
  Iterable hits = jsonRes['hits']; //Iterable로 받아서 반복 처리 용이
  return hits.map((e) => Photo.fromJson(e)).toList();
}
