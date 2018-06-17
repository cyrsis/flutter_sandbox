import 'dart:async';
import 'dart:io';

//Async/Await
main() async {

  function1();
  await function2().then(print);
  function3();
  function4();

}

Future function2() async {
  for(int i = 0; i<1000000000 ; i ++);
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