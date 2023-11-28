class Person {
  String name;
  DateTime birthDate;
  Person(this.name, this.birthDate);

  int get age {
    return DateTime.now().difference(birthDate).inDays ~/ 365;
  }

  String get greeting {
    return 'Hola $name, tu edad es $age';
  }

  String get isAdult {
    return age >= 18 ? 'Eres mayor de edad' : 'Eres menor de edad';
  }

  static fromJson(json) {
    return Person(json['name'], DateTime.parse(json['birthDate']));
  }


}