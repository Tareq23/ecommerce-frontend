import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/data_source/category_data_source.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
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
  bool _check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await categoryController.fetchCategoryAllAdmin();
    print(
        'categoryController.fetchCategoryAllAdmin : ${categoryController.categoryListAdmin.length}');
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
              if (categoryController.categoryListAdmin.isEmpty) {
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
                  arrowHeadColor: TEXT_WHITE,
                  headingRowHeight: 50,
                  showFirstLastButtons: true,
                  rowsPerPage: 5,
                  dataRowHeight: 150,
                  header: const CustomText(text: 'Category List', color: TEXT_WHITE,size: 18,weight: FontWeight.w500,),
                  actions: [
                    customActionButton(onTap: (){
                      context.go('/admin/dashboard/category/add');
                    },title: 'Add New Category',width: 200)
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
                        text: 'Image',color: TEXT_WHITE,
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
                  source: CategoryDataSource(context: context),
                ),
              );
            })),
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
          text: 'View',
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

  // int serial = -8;

  List<DataRow> _createRows() {
    return categoryController.categoryListAdmin.map((e) {
      // print('$serial');
      return DataRow(cells: [
        DataCell(
          CustomText(
            // text: '${++categoryController.categoryListSerial.value}',
            // text: '${serial++}',
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
          InkWell(
            onTap: () {},
            child: CustomText(
              text: 'products'.toCapitalized(),
              size: 16,
              color: TEXT_RED,
            ),
          ),
        ),
        DataCell(
          InkWell(
            onTap: () {
              categoryController.selectedCategory.value.id = e.id;
              categoryController.selectedCategory.value.name = e.name;
              categoryController.selectedCategory.value.imageUrl = e.imageUrl;
              categoryController.missingImage.value = false;
              context.push(context.namedLocation(specificCategoryUpdate,
                  params: <String, String>{'id': e.id.toString()}));
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
            onTap: () async {
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
      ]);
    }).toList();
  }

  showDeleteDialog(BuildContext context, String action) {
    Get.defaultDialog(
        title: 'Are you sure?',
        titleStyle: TextStyle(
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
