

import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/review_model.dart';
import 'package:ecommercefrontend/services/api/api.dart';
import 'package:ecommercefrontend/services/api/api_service.dart';

class ReviewService {

  static Future<dynamic> getReview() async {
    await authenticationController.getToken();
    var response = await ApiService.action(
      url: API.CUSTOMER_REIVEW_ALL,
      actionType: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer ${authenticationController.accessToken.value}',
      },
      body: {},
    );
    if(response.statusCode == 200){
      var jsonString = jsonDecode(response.body) as List;
      return jsonString.map((e) => ReviewModel.parseJsonForGetCustomerReivew(e)).toList();
    }

    return [];
  }




}