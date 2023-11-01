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
        fontFamily: "Lobster-Regular",
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  List<String> items = List<String>.generate(
      20, (index) => "https://picsum.photos/250?image=$index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View 2"),
      ),
      body: Column(
        children: [
          Text(
            "Lista de imagenes",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            "assets/logo.png",
            height: 200,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final img = items[index];
                return ListTile(
                    title: Text("Imagen ${index + 1}",
                    style: const TextStyle(fontFamily: "EduTASBeginner-VariableFont_wght")),
                    subtitle: Text("Subtitle $img",
                    style: const TextStyle(fontFamily: "Kanit-Black")),
                    leading: Image.network(img),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_red_eye_sharp),
                      onPressed: () {
                        alertDialog(context, img);
                      },
                    ));
              },
            ),
          )
        ],
      ),
    );
  }

  void alertDialog(BuildContext context, String img) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Imagen"
            , style: TextStyle(fontFamily: "EduTASBeginner-VariableFont_wght")),
            content: Image.network(img),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          );
        });
  }
}
