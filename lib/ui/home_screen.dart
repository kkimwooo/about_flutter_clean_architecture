import 'dart:convert';

import 'package:about_flutter_clean_architecture/model/photo.dart';
import 'package:about_flutter_clean_architecture/ui/widget/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  List<Photo> _photos = [];

  //기능으로 분리할 수 있는 코드
  Future<List<Photo>> fetch(String query) async {
    const apiKey = '24999262-d78d2a61a8beebcf2664f2cde';
    final res = await http.get(Uri.parse('https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo'));
    Map<String, dynamic> jsonRes = jsonDecode(res.body);
    Iterable hits = jsonRes['hits']; //Iterable로 받아서 반복 처리 용이
    return hits.map((e) => Photo.fromJson(e)).toList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                      final photos = await fetch(_controller.text);
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
