import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:flutter/material.dart';


class TextFieldWidget extends StatefulWidget {
  final String hint;
  final String? labelText;
  String? Function(String? value)? validator;
  bool? expands;
  final int maxLines;
  final int minLines;
  TextEditingController? controller;
  String? initialValue;
  Color? textColor;
  bool isNumber;



  TextFieldWidget({Key? key,this.isNumber=false, this.textColor,required this.hint, this.labelText,this.validator,this.expands,this.maxLines=1,this.minLines=1,this.controller,this.initialValue}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value){

      },
      initialValue: widget.initialValue,
      controller: widget.controller,
      validator: widget.validator,
      maxLines: null,
      minLines: widget.minLines,
      expands: widget.expands??false,
      style: TextStyle(color: widget.textColor??TEXT_DARK),
      keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
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
        enabledBorder: OutlineInputBorder(
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

