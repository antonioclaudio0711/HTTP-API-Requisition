import 'package:flutter/material.dart';
import 'package:http_api/http/screens/http_screen.dart';
import 'package:http_api/http/screens/initial_screen.dart';
import 'package:http_api/http/service/service.dart';

void main() {
  runApp(const MyApp());
  fetchPost();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP API Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const InitialScreen(),
        '/http_screen': (context) => HttpScreen(fetchPost: fetchPost()),
      },
      initialRoute: '/',
    );
  }
}
