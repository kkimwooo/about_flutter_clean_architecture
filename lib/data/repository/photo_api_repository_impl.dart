import 'dart:convert';
import 'package:about_flutter_clean_architecture/data/data_source/pixabay_api.dart';
import 'package:about_flutter_clean_architecture/domain/repository/photo_api_repository.dart';
import 'package:about_flutter_clean_architecture/domain/model/photo.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}
