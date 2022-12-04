

import 'package:ecommercefrontend/models/brand_model.dart';
import 'package:get/get.dart';

class BrandController extends GetxController{

  static BrandController instance = Get.find();

  var updateActionButton = false.obs;

  var selectedBrand = BrandModel.empty().obs;

  var brandList = <BrandModel>[].obs;

  Future<void> fetchAllBrand() async{

    List<BrandModel> _brandList = [
      BrandModel(1, 'brand 1', 'brand-1', false),
      BrandModel(2, 'brand 2', 'brand-2', false),
      BrandModel(3, 'brand 3', 'brand-3', false),
      BrandModel(4, 'brand 4', 'brand-4', false),
    ];
    brandList.assignAll(_brandList);
  }


}