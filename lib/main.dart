import 'package:about_flutter_clean_architecture/di/provider_setup.dart';
import 'package:about_flutter_clean_architecture/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: globalProviders,
    child: const MyApp(),
  ));
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
      home: const HomeScreen(),
    );
  }
}
