import 'dart:async';

import 'package:about_flutter_clean_architecture/presentation/home/home_view_model.dart';
import 'package:about_flutter_clean_architecture/presentation/home/components/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    //잠시 딜레이가 있어야 viewModel 가져올수 있어서 꼼수임
    Future.microtask(() {
      //initState에선 context.watch 사용 불가 read만 가능
      final viewModel = context.read<HomeViewModel>();
      _subscription = viewModel.eventStream.listen((event) {
        event.when(showSnackBar: (message) {
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Provider of 이용하는 방법
    //final viewModel = Provider.of<HomeViewModel>(context);

    //context.wath 사용 방법
    //HomeViewModel에 변동이 있는지 체크하는 것
    //context.watch, context.read,
    final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

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
                      viewModel.fetch(_controller.text);
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
          ),
          state.isLoading
              ? const CircularProgressIndicator()
              :
              //이전에 stream을 통해 변화를 감지하던 부분을 changeNotifier사용으로 대체함
              Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: state.photos.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return PhotoWidget(
                          photo: state.photos[index],
                        );
                      }),
                )
        ],
      ),
    );
  }
}
