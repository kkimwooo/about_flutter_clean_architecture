import 'dart:async';
import 'dart:collection';
import 'package:about_flutter_clean_architecture/data/data_source/result.dart';
import 'package:about_flutter_clean_architecture/domain/repository/photo_api_repository.dart';
import 'package:about_flutter_clean_architecture/domain/model/photo.dart';
import 'package:about_flutter_clean_architecture/presentation/home/home_ui_event.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  //외부에서 ViewModel을 수정하는 것을 방지
  //수정이 필요하면 이 클래스 안에서 수정해라
  //UnmodifiableListView 이걸 이용하면 값을 가져오는 것만 됨 .clear .add 등 안됨
  UnmodifiableListView<Photo> get photos => UnmodifiableListView<Photo>(_photos);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //event를 실시간으로 받아오기 위해 stream으로 처리
  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    _isLoading = true;
    notifyListeners(); // isLoading 값 변화 상태를 전파하기 위함

    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (photos) {
        _photos = photos;
        //notifyListener : 변화가 있으면 새로 그려줌
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}
