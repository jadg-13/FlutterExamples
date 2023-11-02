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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Unidades de Alamcenamientos";

    final Map<String, int> unitToBytes = {
      "Bytes": 1,
      "Kilobytes": 1024,
      "Megabytes": 1048576,
      "Gigabytes": 1073741824,
      "Terabytes": 1099511627776,
    };

    String _startValue = "Bytes";
    String _endValue = "Bytes";
    double _value1 = 0.0;
    double _value2 = 0.0;
    double _result = 0.0;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title, style: const TextStyle(color: Colors.blue)),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                const Text("Calculadora",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text("Seleccione la unidad de almacenamiento",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),

                DropdownButton<String>(
                  value: _startValue,
                  items: unitToBytes.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), onChanged: (String? value) {
                  setState(() {
                    _startValue = value!;
                  });
                },

                ),
                const SizedBox(height: 20),
                const Text("Ingrese el valor a convertir",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.blue, fontSize: 20,),
                  onChanged: (String value) {
                    setState(() {
                      _value1 = double.parse(value);
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text("Seleccione la unidad de almacenamiento",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _endValue,
                  items: unitToBytes.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), onChanged: (String? value) {
                  setState(() {
                    _startValue = value!;
                  });
                },

                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(Icons.calculate,  size: 50),
                  onPressed: () {
                    setState(() {
                      calculate();
                    });
                  },
                ),

                Text("El resultado es: $_result",
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
              ],
            )
        ),
      );
    }

  void calculate() {
    final int startBytes = unitToBytes[_startValue]!;
    final int endBytes = unitToBytes[_endValue]!;
    _result = _value1 * startBytes / endBytes;
  }
  }
