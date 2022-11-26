import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/admin_content_page_upper_widget.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/material.dart';
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
                        child: customActionButton(bgColor: BG_BUTTON,
                            onTap: (){
                          if(_formKey.currentState!.validate()){
                            // print(textEditingController.text);
                          }

                        }, title: 'Add'),
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
