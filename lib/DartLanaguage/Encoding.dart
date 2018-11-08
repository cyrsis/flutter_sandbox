import 'dart:convert';

main() {

  String hello = "Hello world";

  List ebytes = utf8.encode("hello");
  String encoded = base64.encode(ebytes);

  print("Encoded ${encoded}");

  List debyte = base64.decode(encoded);
  String decoded = utf8.decode(debyte);

  print("Decoded ${decoded}");





}
