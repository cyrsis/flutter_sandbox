import 'package:http/http.dart' as http;
main() {

  var url = "http://yahoo.com";

  http.get(url).then((response) {
    print("Response status code: ${response.statusCode}");
    print("Response body: ${response.body}");
  });

}
