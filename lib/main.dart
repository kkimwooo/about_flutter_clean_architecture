import 'package:about_flutter_clean_architecture/data/api.dart';
import 'package:about_flutter_clean_architecture/data/photo_provider.dart';
import 'package:about_flutter_clean_architecture/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Inherited Widget 사용 위해 최상단을 Inherited Widget으로 감싸줌
      //PhotoProvider가 HomeScreen으로 주입
      home: PhotoProvider(api: PixabayApi(), child: const HomeScreen()),
    );
  }
}
