import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
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
  void didChangeDependencies() async{
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
          width: overallController.adminMainContentWidth.value * 0.7,
          height: overallController.adminMainContentHeight.value - 100,
          child: ScrollConfiguration(
            behavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: true),
            child: SingleChildScrollView(
                child: Obx((){
                  if(productController.productList.isEmpty) return const CircularProgressIndicator(color: TEXT_DARK,);
                  return _createDataTable();
                },)
            ),
          ),
        ),
      ],
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
      horizontalMargin: 10,
      columnSpacing: 10,
    );
  }

  List<DataColumn> _createColumns() {
    return const [
      DataColumn(
        label: CustomText(
          text: 'Id',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_WHITE,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Name',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_WHITE,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Image',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_WHITE,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Price',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_WHITE,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Details',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_WHITE,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Update',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_WHITE,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Delete',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_WHITE,
        ),
      )
    ];
  }



  List<DataRow> _createRows() {
    return productController.productList
        .map((e) => DataRow(cells: [
      DataCell(
        CustomText(
          text: '${e.id}',
          size: 16,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: e.name.toString(),
          size: 16,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        Container(
          width: 80,
          height: 200,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Image.network(
            e.imageUrl.toString(),
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
      ),
      DataCell(
        CustomText(
          text: '${e.price}',
          size: 16,
          color: TEXT_RED,
        ),
      ),
      DataCell(
        CustomText(
          text: 'details'.toCapitalized(),
          size: 16,
          color: TEXT_RED,
        ),
        onTap: (){
          context.goNamed(adminSpecificProductDetails,params: {"id" : e.id.toString()});
        }
      ),
      DataCell(
          CustomText(
            text: 'Edit'.toCapitalized(),
            size: 16,
            color: TEXT_RED,
          ),
          onTap: (){

          }
      ),
      DataCell(
        CustomText(
          text: 'Delete'.toCapitalized(),
          size: 16,
          color: TEXT_RED,
        ),
        onTap: (){

        }
      ),
    ]))
        .toList();
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
