import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchByPriceRange extends StatefulWidget {
  const SearchByPriceRange({Key? key}) : super(key: key);

  @override
  State<SearchByPriceRange> createState() => _SearchByPriceRangeState();
}

class _SearchByPriceRangeState extends State<SearchByPriceRange> {

  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();


  @override
  void dispose() {

    minPriceController.dispose();
    maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: 'Price', weight: FontWeight.w600, size: 16,color: TEXT_DARK,),
            const SizedBox(height: 8,),
            Obx((){
              if(overallController.priceRangeFilterError.value){
                return const CustomText(text: 'Invalid price range',size: 16,color: TEXT_DANGER,weight: FontWeight.w500,);
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 30,
                  child: textFormFieldOnlyNumber(hint: 'Min',controller: minPriceController),
                ),
                const SizedBox(width: 8,),
                SizedBox(
                  width: 80,
                  height: 30,
                  child: textFormFieldOnlyNumber(hint: 'Max',controller: maxPriceController),
                ),
                Obx((){
                  if(overallController.isPriceRangeFilterSearchAction.value){
                    return const CircularProgressIndicator();
                  }
                  return InkWell(
                    onTap: () async{
                      int mn = int.parse(minPriceController.text)??0;
                      int mx = int.parse(maxPriceController.text)??0;
                      if(mn>mx || mn==0 || mx == 0){
                        overallController.priceRangeFilterError.value = true;
                        return;
                      }
                      overallController.isPriceRangeFilterSearchAction.value = true;
                      overallController.priceRangeFilterError.value = false;
                      await productController.fetchProductByCategoryWithPriceRange(overallController.categoryForCustomer.value,mn,mx);
                      overallController.isPriceRangeFilterSearchAction.value = false;
                    },
                    child: const Icon(Icons.play_arrow,color: TEXT_RED,size: 30,),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
