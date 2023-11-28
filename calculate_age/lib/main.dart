import 'package:calculate_age/views/personview.dart';
import 'package:flutter/material.dart';

import 'views/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //quitar icono de debug
      debugShowCheckedModeBanner: false,
      title: 'Calculator age',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const MyHomePage(title: 'Calculator age'),
        '/person': (context) => const PersonView(title: 'Add person'),
      },
    );
  }
}
