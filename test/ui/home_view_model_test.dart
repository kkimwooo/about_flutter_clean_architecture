import 'package:about_flutter_clean_architecture/data/api.dart';
import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:about_flutter_clean_architecture/ui/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('스트림 동작 테스트 ', () async {
    final viewModel = HomeViewModel(PixabayApi());

    await viewModel.fetch('apple');
    await viewModel.fetch('apple');

    expect(
      viewModel.photoStream,
      emitsInOrder([
        isA<List<Photo>>(),
        isA<List<Photo>>(),
      ]),
    );
  });
}
