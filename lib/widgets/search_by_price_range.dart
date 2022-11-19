import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

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
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.play_arrow,color: TEXT_RED,size: 30,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
