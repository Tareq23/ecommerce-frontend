

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/data_source/brand_data_source.dart';
import 'package:ecommercefrontend/models/data_source/order_data_source.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPaymentCompletedOder extends StatefulWidget {
  const ViewPaymentCompletedOder({Key? key}) : super(key: key);

  @override
  State<ViewPaymentCompletedOder> createState() => _ViewPaymentCompletedOderState();
}

class _ViewPaymentCompletedOderState extends State<ViewPaymentCompletedOder> {
  bool _check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // await categoryController.fetchCategoryAllAdmin();
    // print(
    //     'categoryController.fetchCategoryAllAdmin : ${categoryController.categoryListAdmin.length}');
    // if (!_check) {
    //   setState(() {
    //     _check = true;
    //   });
    // }
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
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(child: Obx(() {
              if (categoryController.categoryListAdmin.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: TEXT_WHITE,

                  ),
                );
              }
              // return _createDataTable();
              return Theme(
                data: ThemeData(
                  cardColor: ADMIN_BG_SEAL_BROWN,
                ),
                child: PaginatedDataTable(
                  arrowHeadColor: TEXT_WHITE,
                  headingRowHeight: 50,
                  showFirstLastButtons: true,
                  rowsPerPage: 5,
                  dataRowHeight: 150,
                  header: const CustomText(text: 'Complete Order List',color: TEXT_WHITE,size: 18,weight: FontWeight.w500,),
                  actions: [
                    InkWell(
                      onTap: (){},
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
                  columns: const[
                    DataColumn(
                      label: CustomText(
                        text: 'Id',color: TEXT_WHITE,
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: 'Customer',color: TEXT_WHITE,
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: 'Order Date',color: TEXT_WHITE,
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: 'Price',color: TEXT_WHITE,
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: 'Delivery Status',color: TEXT_WHITE,
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: 'Payment',color: TEXT_WHITE,
                      ),
                    ),
                    DataColumn(
                      label: CustomText(
                        text: 'Details',color: TEXT_WHITE,
                      ),
                    ),
                  ],
                  source: CompleteOrderDataSource(context: context),
                ),
              );
            })),
          ),
        ),
      ],
    );
  }
}
