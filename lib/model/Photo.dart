import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable {
  //Equtable 상속 받으면 불변 객체로 사용
  final int id;
  final String tags;

  //json key가 previewURL 인 것을 내부적으로는 previewUrl로 받겠다는 의미
  //이런게 추가되면 build_runner 다시 해주어야함
  @JsonKey(name: 'previewURL')
  final String previewUrl;

  const Photo({
    required this.id,
    required this.tags,
    required this.previewUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

//동일시할 객체를 id로 판단하겠다.
  @override
  List<Object?> get props => [id];
}
