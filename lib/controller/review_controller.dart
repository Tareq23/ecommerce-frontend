


import 'package:ecommercefrontend/models/review_model.dart';
import 'package:ecommercefrontend/services/api/review_api_service.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController{

  static ReviewController instance = Get.find();

  var reviewList = <ReviewModel>[].obs;

  Future<void> fetchCustomerReview() async{

    var result = await ReviewService.getReview();
    reviewList.assignAll(result);
    print('result size : ${result.length}');

  }

}