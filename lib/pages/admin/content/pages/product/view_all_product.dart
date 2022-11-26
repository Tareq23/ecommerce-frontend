import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/data_source/product_data_source.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ViewAllProduct extends StatefulWidget {
  const ViewAllProduct({Key? key}) : super(key: key);

  @override
  State<ViewAllProduct> createState() => _ViewAllProductState();
}

class _ViewAllProductState extends State<ViewAllProduct> {
  bool _check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await productController.fetchAllProductAdmin();
    // print('categoryController.fetchCategoryAllAdmin : ${productController.productList.length}');
    if (!_check) {
      setState(() {
        _check = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.greenAccent,
        ),
        SizedBox(
          width: overallController.adminMainContentWidth.value,
          height: overallController.adminMainContentHeight.value - 100,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: true),
            child: SingleChildScrollView(child: Obx(
              () {
                if (productController.productList.isEmpty) {
                  return const CircularProgressIndicator(
                    color: TEXT_DARK,
                  );
                }
                // return _createDataTable();
                return Theme(
                  data: ThemeData(
                    cardColor: ADMIN_BG_SEAL_BROWN,
                  ),
                  child: PaginatedDataTable(
                    headingRowHeight: 50,
                    showFirstLastButtons: true,
                    rowsPerPage: 5,
                    dataRowHeight: 150,
                    header: CustomText(text: 'Product List',color: TEXT_WHITE,),
                    dragStartBehavior: DragStartBehavior.down,
                    actions: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_rounded,size: 22,color: TEXT_WHITE,),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded,size: 22,color: TEXT_WHITE,),),
                    ],
                    columns: [
                      DataColumn(
                        label: CustomText(
                          text: 'Id',color: TEXT_WHITE,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Name',color: TEXT_WHITE,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Image',color: TEXT_WHITE,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Quantity',color: TEXT_WHITE,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Price',color: TEXT_WHITE,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Details',color: TEXT_WHITE,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Edit',color: TEXT_WHITE,
                        ),
                      ),
                      DataColumn(
                        label: CustomText(
                          text: 'Delete',color: TEXT_WHITE,
                        ),
                      ),
                    ],
                    source: ProductDataSource(context: context),
                  ),
                );
              },
            )),
          ),
        ),
      ],
    );
  }
  showDeleteDialog(BuildContext context, String action) {
    Get.defaultDialog(
        title: 'Are you sure?',
        titleStyle: const TextStyle(
            color: TEXT_RED, fontWeight: FontWeight.w500, fontSize: 16),
        backgroundColor: BG_GREY,
        content: Container(
          width: overallController.screenWidth.value < 600 ? 300 : 400,
          child: Row(
            children: [
              button(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: 'Cancel'),
              button(onPressed: () {}, title: 'Delete')
            ],
          ),
        ));
  }
}
