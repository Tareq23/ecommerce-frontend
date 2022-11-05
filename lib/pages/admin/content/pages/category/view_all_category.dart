import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ViewAllCategory extends StatefulWidget {
  const ViewAllCategory({Key? key}) : super(key: key);

  @override
  State<ViewAllCategory> createState() => _ViewAllCategoryState();
}

class _ViewAllCategoryState extends State<ViewAllCategory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _createDataTable();
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
    );
  }

  List<DataColumn> _createColumns() {
    return const [
      DataColumn(
        label: CustomText(
          text: 'Id',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_DARK,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Name',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_DARK,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Image',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_DARK,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'View',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_DARK,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Update',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_DARK,
        ),
      ),
      DataColumn(
        label: CustomText(
          text: 'Delete',
          size: 16,
          weight: FontWeight.w500,
          color: TEXT_DARK,
        ),
      )
    ];
  }

  List<DataRow> _createRows() {
    return categoryController.categoryList
        .map((e) => DataRow(cells: [
              DataCell(
                CustomText(
                  text: e.id.toString(),
                  size: 16,
                  color: TEXT_DARK,
                ),
              ),
              DataCell(
                CustomText(
                  text: e.name.toString(),
                  size: 16,
                  color: TEXT_DARK,
                ),
              ),
              DataCell(
                Image.network(
                e.imageUrl.toString(),
                width: 80,
                height: 100,
                fit: BoxFit.fill,
                ),
              ),
              DataCell(
                InkWell(
                  onTap: (){},
                  child: CustomText(
                    text: 'products'.toCapitalized(),
                    size: 16,
                    color: TEXT_RED,
                  ),
                ),
              ),
              DataCell(
                InkWell(
                  onTap: (){
                    categoryController.fetchCategoryById(e.id!);
                    context.push('update/category/${e.id}');
                  },
                  child: CustomText(
                    text: 'Edit'.toCapitalized(),
                    size: 16,
                    color: TEXT_RED,
                  ),
                ),
              ),
              DataCell(
                InkWell(
                  onTap: ()async{
                    categoryController.selectedCategory.value.id = e.id;
                    categoryController.selectedCategory.value.name = e.name;
                    categoryController.selectedCategory.value.imageUrl = e.imageUrl;
                    await categoryController.deleteCategory();
                  },
                  child: CustomText(
                    text: 'Delete'.toCapitalized(),
                    size: 16,
                    color: TEXT_RED,
                  ),
                ),
              ),
            ]))
        .toList();
  }

  showDeleteDialog(BuildContext context, String action){

    Get.defaultDialog(
      title: 'Are you sure?',
      titleStyle: TextStyle(color: TEXT_RED,fontWeight: FontWeight.w500,fontSize: 16),
      backgroundColor: BG_GREY,
      content: Container(
        width: overallController.screenWidth.value<600 ? 300 :  400,
        child: Row(
          children: [
            button(onPressed: (){
              Navigator.pop(context);
            }, title: 'Cancel'),
            button(onPressed: (){

            }, title: 'Delete')
          ],
        ),
      )
    );
  }
}
