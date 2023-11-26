import 'package:ejemplofrm/pages/second_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('jadg'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('My Home Page'),
            ElevatedButton(
              child: const Text('Go to second page'),
              onPressed: () {
                _showSecondPage(context);
              },
            ),
           ElevatedButton(
              child: const Text('Go to third page'),
              onPressed: () {
                _showThirdPage(context);
              },
            ),
          ]),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    // Primera forma para ir a la segunda página
    // final route = MaterialPageRoute(builder: (context){
    //   return const SecondPage(name: 'José Durán');
    // });
    // Navigator.of(context).push(
    //   route
    // );
    //Segunda forma para ir a la segunda página
    Navigator.of(context).pushNamed('/second', arguments: 'José Durán ❤️ Marvin Gonzáles ');
  }

  _showThirdPage(BuildContext context) {
    Navigator.of(context).pushNamed('/third');
  }
}