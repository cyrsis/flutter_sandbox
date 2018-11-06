import 'package:http/http.dart' as http;
import 'dart:async';

main(List<String> arguments) async {

  //GET
  var url = 'http://httpbin.org/';
  var response = await http.get(url);
  print('Response status ${response.statusCode}');
  print('Response body ${response.body}');


  //Post
  var url2 = 'http://httpbin.org/post';
  var response2 = await http.post(url,body: 'name=Bryan&color=blue');
  print('Response status ${response.statusCode}');
  print('Response Body ${response.body}');
}
