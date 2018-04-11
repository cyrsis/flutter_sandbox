class Person {
  String firstName;

  Person.fromMe(Map data)
  {
    print("in fromMe");
  }

  Person.fromJson(Map data) {
    print('in Person -1 ');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromMe(data) {
    print('in Employee -2');
  }
}

main() {
  var emp = new Employee.fromJson({});

  // Prints:
  // in Person
  // in Employee
  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }
  print("${emp.firstName}");
  (emp as Person).firstName = 'Bob';
}