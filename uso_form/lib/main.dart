import 'package:flutter/material.dart';

import 'models/person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro Personas',
      //Quitar icono de debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Registro de Personas'),
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
  String name = '';
  String lastName = '';
  int age = 0;

  final FocusNode _nameFocusNode = FocusNode();

  List<Person> persons = [];

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          //icono de la app
          leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              showAuthorMessage();
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                focusNode: _nameFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                ),
                onSaved: (value) {
                  name = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                ),
                onSaved: (value) {
                  lastName = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un apellido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Edad',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  age = int.parse(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una edad';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //boton para agregar a la lista
                  IconButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        addPerson(Person(
                          name: name,
                          lastName: lastName,
                          age: age,
                        ));
                        //limpiar los campos
                        formKey.currentState!.reset();
                        _nameFocusNode.requestFocus();
                      }
                    },
                    icon: const Icon(Icons.add, color: Colors.green),
                  ),
                  //borrar los registros de la lista
                  IconButton(
                    onPressed: () {
                      setState(() {
                        persons.clear();
                      });
                    },
                    //icono de borrar color rojo
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //listado de personas
              Expanded(
                child: ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text(
                              '${persons[index].name} ${persons[index].lastName}'),
                          subtitle: Text(persons[index].age.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPersonMessage(context, persons[index]);
                                  });
                                },
                                icon: const Icon(Icons.remove_red_eye_outlined, color: Colors.blue),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    deletePerson(index);
                                  });
                                },
                                icon: const Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //agregar y actualizar listado
  void addPerson(Person person) {
    setState(() {
      persons.add(person);
    });
  }

//eliminar registro
  void deletePerson(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar'),
          content: const Text('¿Está seguro de eliminar el registro?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  persons.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Si'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  //mensaje de mayor o menor de edad
  void showPersonMessage(BuildContext context, Person person) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${person.name} ${person.lastName}'),
          content: Text(person.getMessage()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void showAuthorMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Registro de Personas'),
            content: const Text('Autor: JADG1308'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cerrar'),
              ),
            ],
          );
        });
  }
}
