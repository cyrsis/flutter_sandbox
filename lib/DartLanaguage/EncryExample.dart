
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';

main(List<String> arguments) {

  final keyBytes = randomBytes(16);
  final key = new KeyParameter(keyBytes);
  final iv = randomBytes(8);
  final params = new ParametersWithIV(key, iv);

  StreamCipher cipher = new StreamCipher("Salsa20");
  cipher.init(true, params);

  Uint8List plain_text = createUint8ListFromString('Hello World');
  Uint8List encrypted_data = cipher.process(plain_text);

  cipher.reset();
  cipher.init(false, params);

  Uint8List decrypted_data = cipher.process(encrypted_data);

  Digest digest = new Digest("SHA-256");
  assert(BASE64.encode(digest.process(plain_text)) == BASE64.encode(digest.process(decrypted_data)));

  print('it works');

}

//From tutorial 2
Uint8List createUint8ListFromString(String value) => new Uint8List.fromList(UTF8.encode(value));


//From Tutorial 3
Uint8List randomBytes(int length) {
  final rnd = new SecureRandom("AES/CTR/AUTO-SEED-PRNG");

  final key = new Uint8List(16);
  final keyParam = new KeyParameter(key);
  final params = new ParametersWithIV(keyParam, new Uint8List(16));

  rnd.seed(params);
  var random = new Random();
  for(int i = 0; i < random.nextInt(255); i++) {
    rnd.nextUint8();
  }

  var bytes = rnd.nextBytes(length);
  return bytes;
}
