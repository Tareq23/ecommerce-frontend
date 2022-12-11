

import 'dart:convert';

import 'package:ecommercefrontend/models/brand_model.dart';
import 'package:ecommercefrontend/services/api/brand_api_service.dart';
import 'package:get/get.dart';

class BrandController extends GetxController{

  static BrandController instance = Get.find();

  var updateActionButton = false.obs;

  var selectedBrand = BrandModel.empty().obs;

  var brandList = <BrandModel>[].obs;

  Future<void> fetchAllBrand() async{

    var result = await BrandApiService.getAllBrand();
    brandList.assignAll(result);
    // print('---------------------> ${brandList.length}');
  }


  Future<bool> addNewBrand() async{
    var result = await BrandApiService.addBrand(selectedBrand.value);
    selectedBrand.value = result as BrandModel;
    if(selectedBrand.value.id != null){
      return true;
    }
    return false;
  }

  Future<bool> deleteBrand() async{
    var result = await BrandApiService.delete(selectedBrand.value);
    return result;
  }

  Future<bool> getBrandById(int id) async{
    var result = await BrandApiService.getBrand(id);
    selectedBrand.value = result ;
    if(selectedBrand.value.id != null){
      return true;
    }
    return false;
  }
  Future<bool> updateBrand() async{
    print('${jsonEncode(selectedBrand.value)}');
    var result = await BrandApiService.updateBrand(selectedBrand.value);
    // selectedBrand.value = result;
    if(selectedBrand.value.id != null){
      return true;
    }
    return false;
  }


}