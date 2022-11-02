import 'package:about_flutter_clean_architecture/data/data_source/result.dart';
import 'package:about_flutter_clean_architecture/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}
