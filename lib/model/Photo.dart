import 'package:freezed_annotation/freezed_annotation.dart';
part 'photo.freezed.dart'; //Freezed package가 만들어주는 파일
part 'photo.g.dart'; //Json Serializable package가 만들어주는 파일

@freezed
class Photo with _$Photo {
  factory Photo({
    required int id,
    required String tags,
    required String previewURL,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
