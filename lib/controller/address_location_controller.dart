import 'dart:convert';

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/load_local_json_file.dart';
import 'package:ecommercefrontend/models/location/district_model.dart';
import 'package:ecommercefrontend/models/location/division_model.dart';
import 'package:ecommercefrontend/models/location/sub_district_model.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  static LocationController instance = Get.find();

  List<DivisionModel> division = <DivisionModel>[].obs;
  List<DistrictModel> district = <DistrictModel>[].obs;
  List<SubDistrictModel> subDistrict = <SubDistrictModel>[].obs;


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

      // if(value == 'বিভাগ'){
      //   district.clear();
      //   // overallController.selectDistrictName.value = 'জেলা';
      //   // print('is division : $value');
      //   // return;
      // }
      // if(value == 'জেলা'){
      //   subDistrict.clear();
      //   overallController.selectSubDistrictName.value = 'উপজেলা';
      //   return;
      // }

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
        district.assignAll(tempDist);
      }

      if(isDistrict && value != 'জেলা'){
        int disId = 0;
        for(int i=0; i<district.length; i++){
          if(district[i].bnName == value){
            disId = district[i].id??0;
            break;
          }
        }
        await loadSubDistrict();
        List<SubDistrictModel> tempSubDist = [];
        for(int i=0; i<subDistrict.length; i++){
          if(subDistrict[i].districtId == disId){
            tempSubDist.add(subDistrict[i]);
          }
        }
        subDistrict.assignAll(tempSubDist);
      }
  }
}
