
import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProfileUpdateWidget extends StatefulWidget {
  final double totalScreenWidth;
  const UserProfileUpdateWidget({Key? key, required this.totalScreenWidth}) : super(key: key);

  @override
  State<UserProfileUpdateWidget> createState() => _UserProfileUpdateWidgetState();
}

class _UserProfileUpdateWidgetState extends State<UserProfileUpdateWidget> {


  TextEditingController birthdayTextController = TextEditingController();


  @override
  void initState() {
    birthdayTextController.text = "";
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.totalScreenWidth * 0.7,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(text: 'My Profile',size: 16,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.9),),
          const SizedBox(height: 15,),
          SizedBox(
            width:widget.totalScreenWidth * 0.65,
            child: Form(
              child: Wrap(
                children: [
                  Container(
                    width: (widget.totalScreenWidth * 0.65) * 0.4,
                    margin: const EdgeInsets.only(bottom: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(text: 'Full Name',size: 14,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.9),),
                        const SizedBox(height: 5,),
                        textFormField(hint: 'Full name',initialValue: 'user full name'),
                      ],
                    ),
                  ),
                  Container(
                    width: (widget.totalScreenWidth * 0.65) * 0.4,
                    margin: const EdgeInsets.only(bottom: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(text: 'My Username',size: 14,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.9),),
                        const SizedBox(height: 5,),
                        textFormField(hint: '',initialValue: 'username@example.com',enable: false),
                      ],
                    ),
                  ),
                  Container(
                    width: (widget.totalScreenWidth * 0.65) * 0.4,
                    margin: const EdgeInsets.only(bottom: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(text: 'Mobile Number',size: 14,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.9),),
                        const SizedBox(height: 5,),
                        textFormField(hint: 'Mobile Number',initialValue: '1234567****'),
                      ],
                    ),
                  ),
                  Container(
                    width: (widget.totalScreenWidth * 0.65) * 0.4,
                    margin: const EdgeInsets.only(bottom: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(text: 'Birthday',size: 14,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.9),),
                        const SizedBox(height: 5,),
                        textFormFieldDatePicker(onTap : () async {
                          await _datePicker();
                        },hint: '',controller: birthdayTextController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              // hit api
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                decoration: BoxDecoration(
                  color: YELLOW,
                  border: Border.all(color: BG_GREY,width: 1.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 40,
                child: const CustomText(text: 'Update',size: 16,weight: FontWeight.w500,color: TEXT_DARK,)
            ),
          ),
        ],
      ),
    );
  }

  Future _datePicker() async{
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            1950), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      // String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        birthdayTextController.text = formattedDate; //set output date to TextField value.
      });
      print(birthdayTextController.text);
    } else {
      print("Date is not selected");
    }
  }
}
