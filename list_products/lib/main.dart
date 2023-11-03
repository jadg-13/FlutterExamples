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
      title: 'Listado',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Listado de Productos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products = [];
  String _name = '';
  String _description = '';
  double _price = 0;
  int _stock = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Nombre del Producto',
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              const Text(
                'Descripción del Producto',
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
              const Text(
                'Precio del Producto',
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _price = double.parse(value);
                  });
                },
              ),
              const Text(
                'Stock del Producto',
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _stock = int.parse(value);
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    addProduct();
                  });
                },
                child: const Text('Agregar Producto'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(products[index].name),
                        subtitle: Text(products[index].description),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_red_eye_sharp),
                          onPressed: () {
                            alertDialog(context, products[index]);
                          },
                        ),
                      ),


                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addProduct() {
    products.add(Product(_name, _description, _price, _stock));
    _name = '';
    _description = '';
    _price = 0;
    _stock = 0;
  }

  void alertDialog(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(product.name),
            content: Text(product.description + "\n" + product.price.toString() + "\n" + product.stock.toString()),
            actions: [
              IconButton(
                onPressed: (){
                  setState(() {
                    products.remove(product);
                  });
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.delete),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close))
            ],
          );
        });
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final int stock;

  Product(this.name, this.description, this.price, this.stock);
}
