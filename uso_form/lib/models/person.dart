//clase person con los atributos de la persona
// name, lastName, age
class Person {
  String name;
  String lastName;
  int age;

  Person({
    required this.name,
    required this.lastName,
    required this.age,
  });

  //Mensaje para decir si es mayo o menor de edad
  String getMessage() {
    return (age >= 18) ? "Es mayor de edad" : "Es menor de edad";
  }

}
