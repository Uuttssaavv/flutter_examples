import 'package:equatable/equatable.dart';

void main() {
  const person1 = Person('Utsav', 23, 987654321);
  const person2 = Person('Ghimire', 23, 987654321);
  const person3 = Person('Utsav', 23, 987654321);
  print(person1);
  print(person1 == person2);
  print(person1 == person3);
  print(person2 == person3);
}

class Person extends Equatable {
  final String name;
  final int age;
  final dynamic phone;

  const Person(this.name, this.age, this.phone);

  @override
  List<Object?> get props => [name, age, phone];
  @override
  bool get stringify => true;
}
