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

      home: MyHomePage(),
    );
  }
}

class MyHomePage  extends StatelessWidget{
  MyHomePage({Key? key}) : super(key: key);

  List<String> items = List<String>.generate(20, (index) => "https://picsum.photos/250?image=$index");
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("List View 2"),
     ),
     body: ListView.builder(
       itemCount: items.length,
       itemBuilder: (BuildContext context, int index){
         final img = items[index];
         return ListTile(
           title: Text("Imagen ${index+1}"),
           subtitle: Text("Subtitle $index"),
           leading: Image.network(img),
           trailing: IconButton(
             icon: Icon(Icons.remove_red_eye_sharp),
             onPressed: (){
               alertDialog(context, img);
             },
           )
         );
       },
     )

   );
  }

  void alertDialog(BuildContext context, String img) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Imagen"),
            content: Image.network(img),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Cerrar")
              )
            ],
          );
        }
    );
  }

}
