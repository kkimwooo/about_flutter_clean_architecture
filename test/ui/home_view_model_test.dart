import 'package:about_flutter_clean_architecture/data/photo_api_repository.dart';
import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:about_flutter_clean_architecture/ui/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('스트림 동작 테스트 ', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    await viewModel.fetch('apple');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
      viewModel.photos,
      result,
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 2295434,
    "pageURL": "https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
    "type": "photo",
    "tags": "spring bird, bird, tit",
    "previewURL": "https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/gad5a107de17bdd8fcdbe9f07af3b7f3256946f2446a252dfe0b0926c5780f1e98ee952bbbf7aff914b0816666f9c4a358daab8c56de014d6a11756d1673c217d_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g902807ddb020f091dd3ca0d530d40e33f7fcc168b8c021e64d97c21772b1a59b4ee16e22566126f3587e60a616b43f54e4249e0e60785facd31bac5bc97305e5_1280.jpg",
    "imageWidth": 5363,
    "imageHeight": 3575,
    "imageSize": 2938651,
    "views": 555740,
    "downloads": 314479,
    "collections": 1988,
    "likes": 1935,
    "comments": 238,
    "user_id": 334088,
    "user": "JillWellington",
    "userImageURL": "https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
  }
];
