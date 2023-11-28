import 'package:flutter/material.dart';

import '../models/person.dart';
import '../providers/person_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //lista de personas donde se guardaran los datos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: (PersonProvider().persons.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: PersonProvider().persons.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(PersonProvider().persons[index].name),
                      subtitle: Column(
                        children: [
                          Text(
                              'Fecha de nacimiento: ${PersonProvider().persons[index].birthDate.day}/${PersonProvider().persons[index].birthDate.month}/${PersonProvider().persons[index].birthDate.year}'),
                          Text(
                              'Edad: ${PersonProvider().persons[index].age}'),
                          Text(PersonProvider().persons[index].isAdult),

                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                PersonProvider().persons.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: Text('No hay personas registradas'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToPersonView(context);
        },
        tooltip: 'Add person',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _goToPersonView(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/person');
    if (result != null && result is Person) {
      setState(() {
        PersonProvider().addPerson(result);
      });
    }
  }

}
