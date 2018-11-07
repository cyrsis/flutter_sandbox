import 'dart:convert';
import 'package:flutter_sandbox/DartLanaguage/ImportExample/imports1.dart'
    as mycode;

main(List<String> arguments) {
  mycode.sayHello();

  String myvalue = 'Hello World';
  List ebytes = UTF8.encode(myvalue);
  String encoded = BASE64.encode(ebytes);

  print('Encoded: ${encoded}');

  List dbytes = BASE64.decode(encoded);
  String decoded = UTF8.decode(dbytes);
  print('Decoded: ${decoded}');
}
