void main() {
  final person1 = Person('Utsav', 23, 987654321);
  final person2 = Person('Ghimire', 23, 987654321);
  final person3 = Person('Utsav', 23, 987654321);
  print(person1 == person2);
  print(person1 == person3);
  print(person2 == person3);
}

class Person {
  final String name;
  final int age;
  final dynamic phone;

  Person(this.name, this.age, this.phone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          phone == other.phone;

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ phone.hashCode;
}
