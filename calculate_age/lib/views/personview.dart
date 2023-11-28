//vista para agregar datos de la persona

import 'package:flutter/material.dart';

import '../models/person.dart';
import '../providers/person_provider.dart';

class PersonView extends StatefulWidget {

  const PersonView({super.key, required this.title});
  final String title;

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  DateTime birthDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Padding(
        padding : EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nombre',
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
                onSaved: (value){
                  name = value!;
                },
              ),
              const SizedBox(height: 16.0,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Fecha de nacimiento: ${birthDate.day}/${birthDate.month}/${birthDate.year}',
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((value){
                        if(value != null){
                          setState(() {
                            birthDate = value;
                          });
                        }
                      });
                    },
                    icon: const Icon(Icons.calendar_today, color: Colors.green,),
                  ),
                ],
              ),

              //Guardar y actualizar los datos en la lista
              IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Person person = Person(name, birthDate);
                    Navigator.of(context).pop(person); // Devuelve la persona como resultado
                  }
                },
                icon: const Icon(Icons.save, color: Colors.blue, size: 50.0,),
              )

            ],
          )
        )
      ),
    );
  }


}
