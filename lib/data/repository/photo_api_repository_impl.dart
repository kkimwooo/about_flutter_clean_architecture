import 'dart:convert';
import 'package:about_flutter_clean_architecture/data/data_source/pixabay_api.dart';
import 'package:about_flutter_clean_architecture/data/data_source/result.dart';
import 'package:about_flutter_clean_architecture/domain/repository/photo_api_repository.dart';
import 'package:about_flutter_clean_architecture/domain/model/photo.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);

    //freezed에서 제공하는 타입 체크 함수 사용
    return result.when(success: (iterable) {
      return Result.success((iterable as Iterable).map((e) => Photo.fromJson(e)).toList());
    }, error: (message) {
      return Result.error(message);
    });
  }
}
