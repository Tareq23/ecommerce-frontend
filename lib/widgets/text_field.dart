import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
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


String? textFieldValidation({required String title, required String value,int? min,int? max})
{
  if(value.isEmpty){
    return '$title field required!';
  }
  if(value.length>max! || value.length<min!){
    return '$title length to be greater than $min and less than $max';
  }
  return null;
}

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final String? labelText;
  String? Function(String? value)? validator;
  bool? expands;
  final int maxLines;
  final int minLines;
  TextEditingController? controller;

  TextFieldWidget({Key? key,required this.hint, this.labelText,this.validator,this.expands,this.maxLines=1,this.minLines=1,this.controller}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      maxLines: null,
      minLines: widget.minLines,
      expands: widget.expands??false,
      decoration: InputDecoration(
        hintText: widget.hint.toTitleCase(),
        labelText: widget.labelText?.toTitleCase()??widget.hint.toTitleCase(),
        hintStyle: const TextStyle(fontSize: 16,color: TEXT_DARK,fontWeight: FontWeight.w500,letterSpacing: 1.2),
        labelStyle: const TextStyle(fontSize: 16,color: TEXT_DARK,fontWeight: FontWeight.w600,letterSpacing: 1.2),
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
}

