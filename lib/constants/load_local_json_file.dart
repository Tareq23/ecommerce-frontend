


import 'package:flutter/services.dart';

class LoadLocalJson {
  static var decodedJson;

  static Future<String> loadJson(String assetJsonUrl) async
  {
    final String jsonData = await rootBundle.loadString(assetJsonUrl);
    // print(jsonData);
    return jsonData;
  }
}