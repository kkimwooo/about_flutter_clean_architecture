import 'dart:async';
import 'dart:collection';
import 'package:about_flutter_clean_architecture/data/photo_api_repository.dart';
import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  //외부에서 ViewModel을 수정하는 것을 방지
  //수정이 필요하면 이 클래스 안에서 수정해라
  //UnmodifiableListView 이걸 이용하면 값을 가져오는 것만 됨 .clear .add 등 안됨
  UnmodifiableListView<Photo> get photos => UnmodifiableListView<Photo>(_photos);

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    //notifyListener : 변화가 있으면 새로 그려줌
    notifyListeners();
  }
}
