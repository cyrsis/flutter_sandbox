//import 'dart:async';
//import 'dart:convert';
//
//import 'package:http/http.dart' as http;
//
//class NetworkUtil {
//  static NetworkUtil _instance = new NetworkUtil.internal();
//
//  NetworkUtil.internal();
//
//  factory NetworkUtil() => _instance;
//
//  final JsonDecoder _decoder = new JsonDecoder();
//
//  Future<dynamic> get(String url) async {
//    return http.get(url).then((http.Response response) {
//      final String res = response.body;
//      final int statusCode = response.statusCode;
//
//      if (statusCode == 200) {
//        return _decoder.convert(res);
//      } else {
//        throw Exception("Error while fetching data");
//      }
//    });
//  }
//}
