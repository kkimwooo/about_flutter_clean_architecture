import 'dart:async';

import 'package:about_flutter_clean_architecture/data/api.dart';
import 'package:about_flutter_clean_architecture/model/photo.dart';

class HomeViewModel {
  final PixabayApi api;

  //InheritedWidget 안에는 불변 객체만 들어올 수 있음..으로 생성하자마자 빈 리스트 할당
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  //Stream 통해 변경 사항 체크
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.api);

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}
