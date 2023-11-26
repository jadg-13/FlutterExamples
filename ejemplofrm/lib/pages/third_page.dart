
import 'dart:math';

import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>{
  String imagen= 'https://picsum.photos/250?image=13';
  String _nombre ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
          Column(
          children: [
            Text('Third Page'),
            Image.network(imagen),
            ElevatedButton(
              child: const Text('Change Image'),
              onPressed: () {
                setState(() {
                  // ignore: avoid_print
                  _changeImage();
                });
              },
            ),
            ElevatedButton(
              child: const Text('Go to second page'),
              onPressed: () {
                _showSecondPage(context);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
              onChanged: (value) {
                setState(() {
                  _nombre = value;
                });
              },
            ),
            ElevatedButton(
              child: const Text('Saludar'),
              onPressed: () {
                setState(() {
                  _saludar();
                });
              },
            )
          ],),
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).pushNamed('/second');
  }

  void _changeImage() {
    //cambiar imagen al azar
    imagen = 'https://picsum.photos/250?image=${(1 + (100 * (Random().nextDouble()))).toInt()}';
  }

  void _saludar() {
    //Mostrar un saludo en una alerta
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Saludo'),
          content: Text('Hola $_nombre'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }


}