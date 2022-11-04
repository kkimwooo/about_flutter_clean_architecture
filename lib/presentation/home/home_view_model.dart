import 'dart:async';
import 'dart:collection';
import 'package:about_flutter_clean_architecture/data/data_source/result.dart';
import 'package:about_flutter_clean_architecture/domain/repository/photo_api_repository.dart';
import 'package:about_flutter_clean_architecture/domain/model/photo.dart';
import 'package:about_flutter_clean_architecture/presentation/home/home_state.dart';
import 'package:about_flutter_clean_architecture/presentation/home/home_ui_event.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  HomeState _state = HomeState([], false);
  HomeState get state => _state;

  //event를 실시간으로 받아오기 위해 stream으로 처리
  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    _state = state.copy(isLoading: true);
    notifyListeners(); // isLoading 값 변화 상태를 전파하기 위함

    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (photos) {
        _state = state.copy(photos: photos);
        //notifyListener : 변화가 있으면 새로 그려줌
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state = state.copy(isLoading: false);
    notifyListeners();
  }
}
