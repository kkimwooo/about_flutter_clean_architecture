import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

//enum에는 data를 넣어서 전달하기 어려움
//freezed를 이용해 확장된 enum 형태인 sealed class 생성
@freezed
abstract class Result<T> with _$Result {
  factory Result.success(T data) = Success;
  factory Result.error(String e) = Error;
}
