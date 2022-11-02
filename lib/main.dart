import 'package:about_flutter_clean_architecture/data/pixabay_api.dart';
import 'package:about_flutter_clean_architecture/ui/home_screen.dart';
import 'package:about_flutter_clean_architecture/ui/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      //ChangeNotifierProvider 사용하여 변화 감지
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
