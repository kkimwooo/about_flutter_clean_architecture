import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:about_flutter_clean_architecture/ui/home_view_model.dart';
import 'package:about_flutter_clean_architecture/ui/widget/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      ///context.read는 최초 빌드시 한번만 읽어 오는 것 GetX의 once랑 같은 기능인듯?
                      context.read<HomeViewModel>().fetch(_controller.text);
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
          ),

          ///Consumer 로 HomeViewModel의 변화가 있을때 이 부분만 그려주도록 함
          Consumer<HomeViewModel>(
            builder: ((context, viewModel, child) {
              return Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: viewModel.photos.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return PhotoWidget(
                        photo: viewModel.photos[index],
                      );
                    }),
              );
            }),
          )
        ],
      ),
    );
  }
}
