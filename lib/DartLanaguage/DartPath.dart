import 'dart:io';

main(List<String> arguments) {

  String path = '/';
  Directory dir = new Directory(path);

  if(dir.existsSync()) {
    print('exists');
  }
  else {
    print('not found');
  }

}
