

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService
{


  static  Future<dynamic> action(
      {required String url,
        required Map<String, String> headers,
        required Object body,
        bool multipart = false,
        bool isImageExists = false,
        bool isImageChanged = false,
        Uint8List? file,
        String? actionType}) async {
    if (actionType!.toLowerCase().contains("post") || actionType.toLowerCase().contains("put")) {
      // uploaded with file
      if (multipart) {
        var request = http.MultipartRequest(actionType.toUpperCase(), Uri.parse(url));
        request.headers.addAll(headers);
        request.fields['body'] = jsonEncode(body);

        request.fields['isImageChanged'] = isImageChanged? "true" : "false";
        request.fields['isImageExists'] = isImageExists? "true" : "false";

        request.files.add(
          http.MultipartFile.fromBytes('file', file!,
              contentType: MediaType('application', 'json'),
              filename: 'Any_name.jpg'),
        );

        int statusCode = 400;
        await request.send().then((response) {
          // print('---------------> Status code : ${response.statusCode}');
          if (response.statusCode == 200 || response.statusCode == 201) {
            statusCode = response.statusCode;
          }
        });
        return statusCode;
      }
      // uploaded without file

      if(actionType.toLowerCase().contains("put")){
        return await http.put(
          Uri.parse(url),
          headers: headers,
          // body: {"username":loginModel.username,"password":loginModel.password},
          body: jsonEncode(body),
        );
      }

      return await http.post(
        Uri.parse(url),
        headers: headers,
        // body: {"username":loginModel.username,"password":loginModel.password},
        body: jsonEncode(body),
      );
    }
    if (actionType.toLowerCase().contains("delete")) {
      return await http.delete(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
    }
    if (actionType.toLowerCase().contains("put")) {
      return await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );
    }
    return await http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

}