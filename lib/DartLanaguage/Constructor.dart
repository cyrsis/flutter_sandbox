main() {
  
  Employee person = new Employee.fromJson({new Map():{
  "12":12,
  }

  });
}

class Person {
  String name;

  Person.fromJson(Map data) {
    print("In person");
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data)
  {
    print("I am employee ${data.toString()}");
  }
  
}