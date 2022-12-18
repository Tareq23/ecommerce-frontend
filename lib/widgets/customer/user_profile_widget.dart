import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class UserProfileWidget extends StatefulWidget {
  final double totalScreenWidth;
  const UserProfileWidget({Key? key, required this.totalScreenWidth}) : super(key: key);

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {

  @override
  void didChangeDependencies() async{

    await overallController.fetchUserInfo();

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
          SizedBox(
            width: double.infinity,
            child: Obx((){
              if(overallController.customerInfo.value.firstName!.isEmpty || overallController.customerInfo.value.firstName == null){
                return const CircularProgressIndicator();
              }
              return SizedBox(
                width:widget.totalScreenWidth * 0.65,
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
                          textFormField(hint: '',initialValue: '${overallController.customerInfo.value.name}',enable: false),
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
                          textFormField(hint: '',initialValue: '${overallController.customerInfo.value.phoneNumber}',enable: false),
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
                          textFormField(hint: '',initialValue: '${overallController.customerInfo.value.dateOfBirth}',enable: false),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            }),
          ),
          InkWell(
            onTap: (){
              GoRouter.of(context).goNamed(customerProfileAccountUpdate,params: {"id" : "1"});
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                decoration: BoxDecoration(
                  color: YELLOW,
                  border: Border.all(color: BG_GREY,width: 1.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 40,
                child: const CustomText(text: 'Edit Profile',size: 16,weight: FontWeight.w500,color: TEXT_DARK,)
            ),
          ),
        ],
      ),
    );
  }
}
