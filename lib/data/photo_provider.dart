import 'dart:async';

import 'package:about_flutter_clean_architecture/data/api.dart';
import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:flutter/material.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  //InheritedWidget 안에는 불변 객체만 들어올 수 있음..으로 생성하자마자 빈 리스트 할당
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  //Stream 통해 변경 사항 체크
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({
    Key? key,
    required this.api,
    required Widget child,
  }) : super(key: key, child: child);

  //context는 widget Tree 정보 갖고 있음
  //context 이용 widget tree 탐색 가장 가까운 PhotoProvider 가져옴
  //만약 없으면 assert 실행
  //of를 통해서 어디에서든 PhotoProvider 호출
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  //Widget이 변경됐을때 변경 상태 전파, oldWidget에 이전 상태 저장 됨
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    //변경의 조건 작성
    return oldWidget.api != api;
  }
}
