import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/data_source/brand_data_source.dart';
import 'package:ecommercefrontend/models/data_source/order_data_source.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewConfirmOrder extends StatefulWidget {
  const ViewConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ViewConfirmOrder> createState() =>
      _ViewConfirmOrderState();
}

class _ViewConfirmOrderState extends State<ViewConfirmOrder> {
  bool _check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await orderController.fetchAllOrderForAdminByOrderStatus('confirm');
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
            child: SingleChildScrollView(
                child:Obx((){
                  if (orderController.orderList.isEmpty) {
                    return const CircularProgressIndicator(
                      color: TEXT_DARK,
                    );
                  }
                  return  Theme(
                    data: ThemeData(
                      cardColor: ADMIN_BG_SEAL_BROWN,
                    ),
                    child: PaginatedDataTable(
                      source: PaymentPendingOrderDataSource(context: context),
                      arrowHeadColor: TEXT_WHITE,
                      headingRowHeight: 50,
                      showFirstLastButtons: true,
                      rowsPerPage: 5,
                      dataRowHeight: 150,
                      header: const CustomText(
                        text: 'Confirm Order List',
                        color: TEXT_WHITE,
                        size: 18,
                        weight: FontWeight.w500,
                      ),
                      columns: const [
                        DataColumn(
                          label: CustomText(
                            text: 'Id',
                            color: TEXT_WHITE,
                          ),
                        ),

                        DataColumn(
                          label: CustomText(
                            text: 'Order Date',
                            color: TEXT_WHITE,
                          ),
                        ),

                        DataColumn(
                          label: CustomText(
                            text: 'Order Status',
                            color: TEXT_WHITE,
                          ),
                        ),
                        DataColumn(
                          label: CustomText(
                            text: 'Payment Status',
                            color: TEXT_WHITE,
                          ),
                        ),
                        DataColumn(
                          label: CustomText(
                            text: 'Details',
                            color: TEXT_WHITE,
                          ),
                        ),
                      ],

                    ),
                  );
                })
            ),
          ),
        ),
      ],
    );
  }
}
