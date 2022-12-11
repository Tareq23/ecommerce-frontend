
import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/data_source/brand_data_source.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ViewAllBrand extends StatefulWidget {
  const ViewAllBrand({Key? key}) : super(key: key);

  @override
  State<ViewAllBrand> createState() => _ViewAllBrandState();
}

class _ViewAllBrandState extends State<ViewAllBrand> {
  bool _check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {

    await brandController.fetchAllBrand();
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
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(child: Obx(() {
              if (brandController.brandList.isEmpty) {
                return const CircularProgressIndicator(
                  color: TEXT_WHITE,
                );
              }
              // return _createDataTable();
              return Theme(
                // data: ThemeData(
                //   cardColor: ADMIN_BG_SEAL_BROWN,
                // ),
                data: ThemeData(cardColor: ADMIN_BG_SEAL_BROWN, textTheme: TextTheme(caption: TextStyle(color: Colors.white))),
                child: PaginatedDataTable(
                  source: BrandDataSource(context: context),
                  arrowHeadColor: TEXT_WHITE,
                  headingRowHeight: 50,
                  showFirstLastButtons: true,
                  rowsPerPage: 5,
                  dataRowHeight: 50,
                  header: const CustomText(text: 'Brand List',color: TEXT_WHITE,size: 18,weight: FontWeight.w500,),
                  actions: [
                    InkWell(
                      onTap: (){
                        GoRouter.of(context).goNamed(adminSpecificBrandAdd);
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
                  columns: const[
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
            },),),
          ),
        ),
      ],
    );
  }
}
