import 'dart:convert';
import 'package:flutter_sandbox/DartLanaguage/ImportExample/imports1.dart'
    as mycode;

main(List<String> arguments) {
  mycode.sayHello();

  String myvalue = 'Hello World';
  List ebytes = utf8.encode(myvalue);
  String encoded = base64.encode(ebytes);

  print('Encoded: ${encoded}');

  List dbytes = base64.decode(encoded);
  String decoded = utf8.decode(dbytes);
  print('Decoded: ${decoded}');
}
