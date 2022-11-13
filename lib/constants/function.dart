import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';



Widget textFormField({required String hint,String? labelText,String Function(String? value)? validator}){
  return TextFormField(
    validator: validator,
    decoration: InputDecoration(
      hintText: hint,
      labelText: labelText??hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1.2,
          color: TEXT_FIELD_BORDER,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1.2,
          color: TEXT_FIELD_BORDER,
        ),
      ),
    ),
  );
}


Widget circularProgressIndicator(){
  return CircularProgressIndicator(
    color: YELLOW.withOpacity(0.8),
  );
}


String? textFieldValidation({required String title, required String value,int? min,int? max, bool isNumber=false}){
  if(isNumber){
    int valInt = int.tryParse(value) ?? 0;
    double valDouble = double.tryParse(value) ?? 0;
    if(valInt == 0 && valDouble==0){
      return '$title must be number and can not be 0';
    }
    return null;
  }

  if(value.isEmpty){
    return '$title field required!';
  }
  if(value.length>max! || value.length<min!){
    return '$title length to be greater than $min and less than $max';
  }

  return null;
}


Widget button({required VoidCallback onPressed, Color? bgColor, Color? textColor,required String title, double? width})
{
  return  OutlinedButton(
    style: OutlinedButton.styleFrom(
      backgroundColor: bgColor??BG_YELLOW,
      fixedSize: Size.fromWidth(width??100),
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      side: const BorderSide(
          width: 1.8, color: Colors.transparent),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    onPressed: onPressed,
    child: CustomText(
      text: title,
      color: textColor??TEXT_WHITE,
      size: 18,
      weight: FontWeight.w500,
    ),
  );
}

