import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/admin_content_page_upper_widget.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AddNewBrand extends StatefulWidget {
  const AddNewBrand({Key? key}) : super(key: key);

  @override
  State<AddNewBrand> createState() => _AddNewBrandState();
}

class _AddNewBrandState extends State<AddNewBrand> {

  final textEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController.addListener(() {
      // textEditingController.text = textEditingController.text.trim();
    });
    super.initState();
  }

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18),
      margin: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: Color(0xffe8e8e8),
      ),
      width: overallController.adminMainContentWidth.value,
      height: overallController.adminMainContentHeight.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: overallController.adminMainContentWidth.value,
            height: overallController.adminMainContentHeight.value - 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ScrollConfiguration(
              behavior:
              ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      AdminPageContentUpperWidget(pageTitle: 'Add New Brand',onTap: (){
                        GoRouter.of(context).goNamed(adminBrandViewAll);
                      },linkTitle: 'All Brand',),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        controller: textEditingController,
                        hint: 'Name',
                        validator: (value){
                          return textFieldValidation(title: 'Brand name',value: value!,min: 3,max: 50);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        // child: customActionButton(bgColor: BG_BUTTON,
                        //     onTap: (){
                        //   if(_formKey.currentState!.validate()){
                        //     // print(textEditingController.text);
                        //   }
                        //
                        // }, title: 'Add'),
                        child: Obx(() {
                          if (brandController.updateActionButton.value) {
                            return circularProgressIndicator();
                          }
                          return InkWell(
                            onTap: () async {
                              if(_formKey.currentState!.validate()){
                                brandController.updateActionButton.value = true;
                                brandController.selectedBrand.value.name = textEditingController.text.trim();


                                if(await brandController.addNewBrand()){
                                  print('add brand----------------> success');
                                  GoRouter.of(context).goNamed(adminBrandViewAll);
                                }



                                brandController.updateActionButton.value = false;
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              margin: const EdgeInsets.only(top: 35),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: BG_BUTTON,
                              ),
                              child: const CustomText(
                                text: 'Save',
                                color: TEXT_WHITE,
                                size: 16,
                                weight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
