import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/product_description.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminProductDetails extends StatefulWidget {
  const AdminProductDetails({Key? key}) : super(key: key);

  @override
  State<AdminProductDetails> createState() => _AdminProductDetailsState();
}

class _AdminProductDetailsState extends State<AdminProductDetails> {

  bool checkDetails = false;

  @override
  void didChangeDependencies() async{
    if(!checkDetails){

      var url = GoRouter.of(context).location.split("/");
      int id = int.parse(url.elementAt(url.length - 1)) ?? 0;
      print('--------------------> product Details : id : $id');
      if(id == 0){
        // Page Not Found
      }
      await productController.fetchProductById(id);


      setState(() {
        checkDetails=true;
      });
    }

    super.didChangeDependencies();
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: Color(0xffe8e8e8),
      ),
      width: overallController.adminMainContentWidth.value,
      height: overallController.adminMainContentHeight.value,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: overallController.adminMainContentWidth.value - 18,
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child:  CustomText(text: '${productController.selectProduct.value.name}',size: 16,weight: FontWeight.w600,),
              ),
              // image , title, and price
              Container(
                width: double.infinity,
                height: 300,
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: overallController.adminMainContentWidth.value * 0.5,
                      child: Image.network(
                        productController.selectProduct.value.imageUrl.toString(),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder: (context, object, stacktrace) {
                          return Image.asset(
                            'assets/images/no_image_available.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                        height: double.infinity,
                        width: overallController.adminMainContentWidth.value * 0.5 - 30,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(text: '${productController.selectProduct.value.name}',size: 16,weight: FontWeight.w600,),
                            const SizedBox(height: 12,),
                            CustomRichText(titleText: 'Price : ',valueText: '${productController.selectProduct.value.regularPrice} টাকা মাত্র',),
                            const SizedBox(height: 12,),
                            CustomRichText(titleText: 'Category : ',valueText: '${productController.selectProduct.value.categoryName}',valueColor: TEXT_DANGER,),
                            const SizedBox(height: 12,),
                            CustomRichText(titleText: 'Brand : ',titleColor: TEXT_DARK,valueText: '${productController.selectProduct.value.brandName}',size: 16,valueColor: TEXT_DANGER,),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomText(
                  text: 'Product details of ${productController.selectProduct.value.name?.toTitleCase()}',
                  size: 16,
                  weight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ProductDescription(desc: '${productController.selectProduct.value.description}'),
              ),
              // SizedBox(
              //   width: overallController.adminMainContentWidth.value,
              //   height: overallController.adminMainContentHeight.value - 100,
              //   child: ScrollConfiguration(
              //     behavior:
              //     ScrollConfiguration.of(context).copyWith(scrollbars: true),
              //     child: SingleChildScrollView(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //
              //         ],
              //       )
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
