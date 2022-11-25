import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Widget textFormFieldOnlyNumber(
    {required String hint, TextEditingController? controller}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    maxLines: 1,
    maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))
    ],
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14, color: TEXT_DARK),
      border: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
      enabledBorder: outlineInputBorder(),
    ),
  );
}

OutlineInputBorder outlineInputBorder({bool enable = true}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
      width: !enable ? 0 : 1.2,
      color: !enable ? Colors.transparent : TEXT_FIELD_BORDER,
    ),
  );
}

Image loadImage(
    {required String imageUrl, required double width, required double height}) {
  return Image.network(
    imageUrl,
    width: width,
    height: height,
    fit: BoxFit.fill,
    errorBuilder: (_, __, ___) {
      return Image.asset(
        'assets/images/no_image_available.png',
        width: width,
        height: height,
        fit: BoxFit.fill,
      );
    },
  );
}

Widget textFormField(
    {required String hint,
    TextEditingController? controller,
    String? labelText,
    String Function(String? value)? validator,
    String initialValue = '',
    bool hintDisable = false,
    bool enable = true}) {
  return TextFormField(
    enabled: enable,
    validator: validator,
    initialValue: initialValue,
    decoration: InputDecoration(
      hintText: hintDisable == false ? hint : "",
      labelText: labelText ?? hint,
      border: outlineInputBorder(enable: enable),
      focusedBorder: outlineInputBorder(enable: enable),
    ),
  );
}

Widget textFormFieldDatePicker(
    {required String hint,
    required VoidCallback onTap,
    TextEditingController? controller,
    String? labelText,
    String Function(String? value)? validator,
    bool enable = true}) {
  return TextFormField(
      enabled: enable,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: labelText ?? hint,
        border: outlineInputBorder(enable: enable),
        focusedBorder: outlineInputBorder(enable: enable),
      ),
      onTap: onTap);
}

Future<void> addressAlertDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      Size screenSize = MediaQuery.of(context).size;
      return Container(
        width: screenSize.width * 0.2,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: BORDER_GREY, width: 1.3)),
              ),
              child: CustomText(
                text: 'Add New Address',
                size: 16,
                color: TEXT_DARK.withOpacity(0.8),
              ),
            )
          ],
        ),
      );
    },
  );
}

DropdownButtonFormField locationSelectDropDown(
    {bool isDivision = false,
    bool isDistrict = false,
    bool isSubDistrict = false}) {
  return DropdownButtonFormField(
    decoration: InputDecoration(
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),),
    isExpanded: true,
    value: null,
    hint: CustomText(
      text: isDivision
          ? overallController.selectDivisionName.value
          : isDistrict
          ? overallController.selectDistrictName.value
          : isSubDistrict
          ? overallController.selectSubDistrictName.value
          : '',
    ),
    items: [
      DropdownMenuItem(
        value: isDivision?  'বিভাগ' : isDistrict? 'জেলা' : isSubDistrict? 'উপজেলা' : '',
        // value: isDivision
        //     ? overallController.selectDivisionName.value
        //     : isDistrict
        //     ? overallController.selectDistrictName.value
        //     : isSubDistrict
        //     ? overallController.selectSubDistrictName.value
        //     : '',
        child: CustomText(
          // text: isDivision
          //     ? overallController.selectDivisionName.value
          //     : isDistrict
          //     ? overallController.selectDistrictName.value
          //     : isSubDistrict
          //     ? overallController.selectSubDistrictName.value
          //     : '',
          text: isDivision?  'বিভাগ' : isDistrict? 'জেলা' : isSubDistrict? 'উপজেলা' : '',
        ),
      ),
      if(isDivision && locationController.division.isNotEmpty)
      ...locationController.division.map((e) => DropdownMenuItem<String>(
            value: e.bnName,
            child: CustomText(
              text: e.bnName!,
            ),
          ),),

      if(isDistrict && locationController.district.isNotEmpty)
      ...locationController.district.map((e) => DropdownMenuItem<String>(
            value: e.bnName,
            child: CustomText(
              text: e.bnName!,
            ),
          ),),

      if(isSubDistrict && locationController.subDistrict.isNotEmpty)
      ...locationController.subDistrict.map((e) => DropdownMenuItem<String>(
            value: e.bnName,
            child: CustomText(
              text: e.bnName!,
            ),
          ),)
    ],
    onChanged: (value) async{
      if(isDivision) {
        if(value != overallController.selectDivisionName.value ){
          overallController.selectDistrictName.value = 'জেলা';
          overallController.selectSubDistrictName.value = 'উপজেলা';
          await locationController.reloadLocationData(isDivision: true,value : value);
        }
        overallController.selectDivisionName.value = value!;
      }
      if(isDistrict) {
        // overallController.selectDistrictName.value = value!;
        if(value != overallController.selectDistrictName.value ){
          overallController.selectSubDistrictName.value = 'উপজেলা';
          await locationController.reloadLocationData(isDistrict: true,value : value);
        }
        overallController.selectDistrictName.value = value!;

      }
      if(isSubDistrict) {
        overallController.selectSubDistrictName.value = value!;
      }
    },
  );
}

Widget circularProgressIndicator() {
  return CircularProgressIndicator(
    color: YELLOW.withOpacity(0.8),
  );
}

String? textFieldValidation(
    {required String title,
    required String value,
    int? min,
    int? max,
    bool isNumber = false}) {
  if (isNumber) {
    int valInt = int.tryParse(value) ?? 0;
    double valDouble = double.tryParse(value) ?? 0;
    if (valInt == 0 && valDouble == 0) {
      return '$title must be number and can not be 0';
    }
    return null;
  }

  if (value.isEmpty) {
    return '$title field required!';
  }
  if (value.length > max! || value.length < min!) {
    return '$title length to be greater than $min and less than $max';
  }

  return null;
}

Widget button(
    {required VoidCallback onPressed,
    Color? bgColor,
    Color? textColor,
    required String title,
    double? width}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      backgroundColor: bgColor ?? BG_YELLOW,
      fixedSize: Size.fromWidth(width ?? 100),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      side: const BorderSide(width: 1.8, color: Colors.transparent),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    onPressed: onPressed,
    child: CustomText(
      text: title,
      color: textColor ?? TEXT_WHITE,
      size: 18,
      weight: FontWeight.w500,
    ),
  );
}
