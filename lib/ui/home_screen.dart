import 'package:about_flutter_clean_architecture/data/photo_provider.dart';
import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:about_flutter_clean_architecture/ui/widget/photo_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  //데이터를 담는 부분도 분리 필요
  List<Photo> _photos = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //context 넣어서 photoprovider 호출
    final photoProvider = PhotoProvider.of(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            '이미지 검색',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                suffixIcon: IconButton(
                    onPressed: () async {
                      final photos = await photoProvider.api.fetch(_controller.text);
                      setState(() {
                        _photos = photos;
                      });
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return PhotoWidget(
                    photo: _photos[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
