import 'package:http/http.dart' as http;

main(List<String> arguments) async {

  var url = 'http://www.voidrealms.com';
  var response = await http.get(url);
  print('Length: ${response.body.length}');

}
