import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CustomerAccountAddressWidget extends StatefulWidget {
  final double totalScreenWidth;
  const CustomerAccountAddressWidget({Key? key, required this.totalScreenWidth})
      : super(key: key);

  @override
  State<CustomerAccountAddressWidget> createState() =>
      _CustomerAccountAddressWidgetState();
}

class _CustomerAccountAddressWidgetState
    extends State<CustomerAccountAddressWidget> {
  @override
  void didChangeDependencies() async {
    await locationController.loadDivision();
    await locationController.loadDistrict();
    await locationController.loadSubDistrict();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: widget.totalScreenWidth * 0.7,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                text: 'Address List',
                size: 16,
                weight: FontWeight.w500,
                color: TEXT_DARK.withOpacity(0.9),
              ),
              InkWell(
                onTap: () async {
                  await _addressAlertDialog(context);
                },
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: YELLOW,
                      border: Border.all(color: BG_GREY, width: 1.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 40,
                    child: const CustomText(
                      text: 'Add New Address',
                      size: 16,
                      weight: FontWeight.w500,
                      color: TEXT_DARK,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              GoRouter.of(context)
                  .goNamed(customerProfileAccountUpdate, params: {"id": "1"});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: YELLOW,
                border: Border.all(color: BG_GREY, width: 1.2),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 40,
              child: const CustomText(
                text: 'Edit Profile',
                size: 16,
                weight: FontWeight.w500,
                color: TEXT_DARK,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addressAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        Size screenSize = MediaQuery.of(context).size;
        return Center(
          child: Card(
            elevation: 15,
            child: Container(
              width: screenSize.width * 0.5,
              height: screenSize.height * 0.8,
              // padding: const EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: BORDER_GREY, width: 1.3)),
                    ),
                    child: CustomText(
                      text: 'Add New Address',
                      size: 16,
                      color: TEXT_DARK.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: (screenSize.width * 0.5) * 0.45,
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            // CustomText(text: 'Name'),
                            const SizedBox(
                              height: 15,
                            ),
                            textFormField(hint: 'Name', hintDisable: true),
                            // CustomText(text: 'Mobile Number'),
                            const SizedBox(
                              height: 15,
                            ),
                            textFormField(
                                hint: 'Mobile Number', hintDisable: true),
                            const SizedBox(
                              height: 15,
                            ),
                            if (locationController.division.isNotEmpty)
                              Obx(()=>locationSelectDropDown(isDivision: true)),

                            const SizedBox(
                              height: 15,
                            ),
                            if (locationController.district.isNotEmpty)
                              Obx(()=>locationSelectDropDown(isDistrict: true)),
                            const SizedBox(
                              height: 15,
                            ),
                            if (locationController.subDistrict.isNotEmpty)
                              Obx(()=>locationSelectDropDown(isSubDistrict: true)),
                            // DropdownButtonFormField(
                            //   decoration: InputDecoration(
                            //     border: outlineInputBorder(),
                            //     focusedBorder: outlineInputBorder(),
                            //     enabledBorder: outlineInputBorder()
                            //   ),
                            //   isExpanded: true,
                            //   value: null,
                            //   hint: Obx(() {
                            //     return CustomText(
                            //         text: overallController
                            //             .selectDivisionName.value);
                            //   }),
                            //   items: [
                            //     DropdownMenuItem(
                            //       value: overallController
                            //           .selectDivisionName.value,
                            //       child: CustomText(
                            //         text: overallController
                            //             .selectDivisionName.value,
                            //       ),
                            //     ),
                            //     ...locationController.division
                            //         .map((e) => DropdownMenuItem<String>(
                            //               value: e.bnName,
                            //               child: CustomText(
                            //                 text: e.bnName!,
                            //               ),
                            //             ))
                            //   ],
                            //   onChanged: (value) {
                            //     overallController.selectDivisionName.value =
                            //         value!;
                            //   },
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
