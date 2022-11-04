import 'dart:math';

import 'package:about_flutter_clean_architecture/data/data_source/result.dart';
import 'package:about_flutter_clean_architecture/domain/model/photo.dart';
import 'package:about_flutter_clean_architecture/domain/repository/photo_api_repository.dart';

//비지니스 로직은 use Case 에서 처리
class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  //call을 쓰면 호출 부분에서 call을 생략하고 사용가능
  //ex. GetphotoUseCase(query)
  Future<Result<List<Photo>>> call(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);

    return result.when(success: (photos) {
      return Result.success(photos.sublist(0, min(3, photos.length as num)));
    }, error: (message) {
      return Result.error(message);
    });
  }
}
