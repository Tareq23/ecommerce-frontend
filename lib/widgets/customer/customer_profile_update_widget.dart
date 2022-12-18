
import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserProfileUpdateWidget extends StatefulWidget {
  final double totalScreenWidth;
  const UserProfileUpdateWidget({Key? key, required this.totalScreenWidth}) : super(key: key);

  @override
  State<UserProfileUpdateWidget> createState() => _UserProfileUpdateWidgetState();
}

class _UserProfileUpdateWidgetState extends State<UserProfileUpdateWidget> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController birthdayTextController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();


  @override
  void initState() {
    birthdayTextController.text = "";
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await overallController.fetchUserInfo();
    firstNameController.text = overallController.customerInfo.value.firstName!;
    lastNameController.text = overallController.customerInfo.value.lastName!;
    birthdayTextController.text = overallController.customerInfo.value.dateOfBirth!;
    phoneNumberController.text = overallController.customerInfo.value.phoneNumber!;
    super.didChangeDependencies();
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
          Obx((){
            if(overallController.customerInfo.value.firstName!.isEmpty || overallController.customerInfo.value.firstName == null){
              return const CircularProgressIndicator();
            }
            return SizedBox(
              width:widget.totalScreenWidth * 0.65,
              child: Form(
                key: _formKey,
                child: Wrap(
                  children: [
                    Container(
                      width: (widget.totalScreenWidth * 0.65) * 0.4,
                      margin: const EdgeInsets.only(bottom: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(text: 'First Name',size: 14,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.9),),
                          const SizedBox(height: 5,),
                          textFormFieldWithController(hint: '${overallController.customerInfo.value.firstName}',controller: firstNameController),
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
                          CustomText(text: 'Last Name',size: 14,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.9),),
                          const SizedBox(height: 5,),
                          textFormFieldWithController(hint: 'Last name',controller: lastNameController),
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
                          textFormField(hint: '',initialValue: '${overallController.customerInfo.value.username}',enable: false),
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
                          textFormFieldWithController(hint: 'Mobile Number',controller: phoneNumberController,validator: (value){
                            return textFieldValidation(title: 'Mobile Number', value: value!,min: 11,max: 11);
                          },),
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
                          textFormFieldDatePicker(
                            onChange: (value)async{
                              await _datePicker();
                            },
                              validator: (value){
                                return textFieldValidation(title: 'Birthday',value: value!,max: 10,min: 10);
                              },
                              onTap : () async {
                            await _datePicker();
                          },hint: '',controller: birthdayTextController),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          InkWell(
            onTap: () async{
              // hit api
              if(!_formKey.currentState!.validate()){
                return ;
              }
              overallController.customerInfo.value.firstName = firstNameController.text.trim();
              overallController.customerInfo.value.lastName = lastNameController.text.trim();
              overallController.customerInfo.value.phoneNumber = phoneNumberController.text.trim();
              overallController.customerInfo.value.dateOfBirth = birthdayTextController.text.trim();

              await overallController.updateUserInfo(overallController.customerInfo.value);
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
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        birthdayTextController.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }
}
