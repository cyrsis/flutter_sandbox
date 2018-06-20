main() {
  var chair = new Chair("padded", 3);
  print("Here is the chair ${chair.name} & age is ${chair.age}");
}

class Chair extends Thing {
  Chair(String name, int age): super(name,age);

  @override
  String get color => "Blue";
}

abstract class Thing {
  String name;
  int age;

  Thing(this.name, this.age);

  String get color;

}

class A {
  int a;
  int b;
  
}

class B {
  int c;
}

class C implements A,B {
  @override
  int a;

  @override
  int b;

  @override
  int c;

}