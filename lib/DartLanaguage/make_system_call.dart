import 'dart:async';

//Async/Await
main() async {

  function1();
  await function2().then(print);
  function3();
  function4();

}

Future function2() async {

  return "Second";
}

void function4() {
}

void function3() {
  print("Third");
}

void function1() {
  print("First");
}