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
        SizedBox(
          width: overallController.adminMainContentWidth.value,
          height: overallController.adminMainContentHeight.value,
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
                  data: ThemeData(cardColor: ADMIN_BG_SEAL_BROWN, textTheme: const TextTheme(caption: TextStyle(color: Colors.white),),),
                  child: PaginatedDataTable(
                    source: ProductDataSource(context: context),
                    headingRowHeight: 50,
                    arrowHeadColor: TEXT_WHITE,
                    showFirstLastButtons: true,
                    rowsPerPage: 5,
                    dataRowHeight: 110,
                    header: CustomText(text: 'Product List',color: TEXT_WHITE,),
                    dragStartBehavior: DragStartBehavior.down,
                    actions: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_rounded,size: 22,color: TEXT_WHITE,),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded,size: 22,color: TEXT_WHITE,),),
                      InkWell(
                        onTap: (){
                          GoRouter.of(context).goNamed(adminAddNewProduct);
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: TEXT_DANGER,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: const CustomText(text: 'Add New',size: 16,weight: FontWeight.w600,color: TEXT_WHITE,),
                        ),
                      )
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
                        label: Container(
                          width:50,
                          constraints: BoxConstraints(
                            maxWidth: 50,
                          ),
                          child: CustomText(
                            text: 'Regular\nPrice',color: TEXT_WHITE,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                          width:50,
                          child: CustomText(
                            text: 'Discount\nPrice',color: TEXT_WHITE,
                          ),
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
