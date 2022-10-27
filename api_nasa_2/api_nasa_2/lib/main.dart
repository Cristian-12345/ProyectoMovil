import 'package:api_nasa_2/r_o/r_o.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: "/",
      routes: getAplicationRoutes,
    );
  }
}
