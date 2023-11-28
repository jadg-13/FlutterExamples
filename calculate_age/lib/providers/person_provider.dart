
import '../models/person.dart';

class PersonProvider{

  late List<Person> _persons;

  static final PersonProvider _instance = PersonProvider._private();

  PersonProvider._private(){
    _persons = [];
  }

  factory PersonProvider(){
    return _instance;
  }

  List<Person> get persons => _persons;

  void addPerson(Person person){
    _persons.add(person);
  }

}