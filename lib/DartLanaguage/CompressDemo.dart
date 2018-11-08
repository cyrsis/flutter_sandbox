import 'dart:io';
import 'dart:convert';

main(List<String> arguments) {

  String compressed = Directory.current.path + '/compressed.txt';

  File file = new File(compressed);
  file.createSync();
  file.writeAsBytesSync(GZIP.encode(utf8.encode('Hello World')));

  print(utf8.decode(GZIP.decode(file.readAsBytesSync())));

}
