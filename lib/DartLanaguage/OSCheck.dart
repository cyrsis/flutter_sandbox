import 'dart:io';

main(List<String> arguments) {

  if(Platform.isWindows) print('This is Windows');
  if(Platform.isLinux) print('This is Linux');
  if(Platform.isMacOS) print('This is Mac');
  if(Platform.isAndroid) print('This is Android');
  if(Platform.isIOS) print('This is IOS');
  if(Platform.isFuchsia) print('This is Fuchsia');

  print(Platform.environment['PATH']);
}
