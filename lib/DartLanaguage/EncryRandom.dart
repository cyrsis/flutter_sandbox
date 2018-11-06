import 'package:pointycastle/pointycastle.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';

main(List<String> arguments) {

  print(randomBytes(16));

}

Uint8List randomBytes(int length) {
  final rnd = new SecureRandom("AES/CTR/AUTO-SEED-PRNG");

  final key = new Uint8List(16);
  final keyParam = new KeyParameter(key);
  final params = new ParametersWithIV(keyParam,new Uint8List(16));

  rnd.seed(params);

  var random = new Random();
  for(int i = 0; i < random.nextInt(255); i++) {
    rnd.nextUint8();
  }

  var bytes = rnd.nextBytes(length);
  return bytes;
}
