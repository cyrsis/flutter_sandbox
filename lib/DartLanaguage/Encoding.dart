import 'dart:convert';

main() {

  String hello = "Hello world";

  List ebytes = UTF8.encode("hello");
  String encoded = BASE64.encode(ebytes);

  print("Encoded ${encoded}");

  List debyte = BASE64.decode(encoded);
  String decoded = UTF8.decode(debyte);

  print("Decoded ${decoded}");





}
