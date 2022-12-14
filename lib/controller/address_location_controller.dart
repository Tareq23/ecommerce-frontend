import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/load_local_json_file.dart';
import 'package:ecommercefrontend/models/address_model.dart';
import 'package:ecommercefrontend/models/location/district_model.dart';
import 'package:ecommercefrontend/models/location/division_model.dart';
import 'package:ecommercefrontend/models/location/sub_district_model.dart';
import 'package:ecommercefrontend/services/api/location_address_api_service.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  static LocationController instance = Get.find();

  List<DivisionModel> division = <DivisionModel>[].obs;
  List<DistrictModel> district = <DistrictModel>[].obs;
  List<SubDistrictModel> subDistrict = <SubDistrictModel>[].obs;

  var selectedAddress = AddressModel.empty().obs;
  var setDefaultAddress = false.obs;
  var addressList = <AddressModel>[].obs;


  Future<void> loadDivision() async {
    if (division.isEmpty) {
      var jsonData = await LoadLocalJson.loadJson('json/divisions.json');
      var res = jsonDecode(jsonData) as List;
      division.assignAll(res.map((e) => DivisionModel.parseJson(e)));
      print("division.length ${division.length}");
    }
  }

  Future<void> loadDistrict() async {
    if (district.isEmpty) {
      var jsonData = await LoadLocalJson.loadJson('json/districts.json');
      var res = jsonDecode(jsonData) as List;
      district.assignAll(res.map((e) => DistrictModel.parseJson(e)));
      print("district.length ${district.length}");
    }
  }

  Future<void> loadSubDistrict() async {
    if (subDistrict.isEmpty) {
      var jsonData = await LoadLocalJson.loadJson('json/sub-districts.json');
      var res = jsonDecode(jsonData) as List;
      subDistrict.assignAll(res.map((e) => SubDistrictModel.parseJson(e)));
      print("subDistrict.length ${subDistrict.length}");
    }
  }

  Future<void> reloadLocationData(
      {bool isDivision = false,
      bool isDistrict = false,
      bool isSubDistrict = false, required String value}) async {

      if(isDivision && value != 'বিভাগ'){
        int divId = 0;
        for(int i=0; i<division.length; i++){
          if(division[i].bnName == value){
            divId = division[i].id??0;
            break;
          }
        }
        district.clear();
        await loadDistrict();
        List<DistrictModel> tempDist = [];
        for(int i=0; i<district.length; i++){
          if(district[i].divisionId == divId){
            tempDist.add(district[i]);
          }
        }
        district.clear();
        subDistrict.clear();
        district.assignAll(tempDist);
        overallController.isDivisionChange.value = false;
      }

      if(isDistrict && value != 'জেলা'){
        int disId = 0;
        for(int i=0; i<district.length; i++){
          if(district[i].bnName == value){
            disId = district[i].id??0;
            break;
          }
        }
        subDistrict.clear();
        await loadSubDistrict();
        List<SubDistrictModel> tempSubDist = [];
        for(int i=0; i<subDistrict.length; i++){
          if(subDistrict[i].districtId == disId){
            tempSubDist.add(subDistrict[i]);
          }
        }

        subDistrict.clear();
        subDistrict.assignAll(tempSubDist);
        overallController.isDistrictChange.value = false;
      }
  }


  Future<void> addAddress(AddressModel address) async{

    var result = await AddressService.addAddress(address);

  }

  Future<void> getAllAddress() async{
    var result = await AddressService.getAddress();
    addressList.assignAll(result);
  }

  Future<void> updateDefaultAddress(int id) async{

    var result = await AddressService.updateDefaultAddress(id);
    await overallController.fetchUserInfo();
  }

}
