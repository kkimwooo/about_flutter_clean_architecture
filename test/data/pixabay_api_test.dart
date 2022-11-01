import 'package:about_flutter_clean_architecture/data/pixabay_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
void main() {
  test('pixabay test', () async {
    final api = PixabayApi();
    final result = await api.fetch('iphone');

    expect(result.length, 20);
  });
}
