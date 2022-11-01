import 'package:about_flutter_clean_architecture/ui/home_view_model.dart';
import 'package:flutter/material.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;

  PhotoProvider({
    Key? key,
    required this.viewModel,
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

  //Widget이 변경됐을때 변경 상태 전파, oldWidget에 이전 상태 저장 됨
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
