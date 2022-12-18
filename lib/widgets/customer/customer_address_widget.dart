import 'dart:convert';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/address_model.dart';
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
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController detailsTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  bool isValidated = true;
  bool isDefaultAddress = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await locationController.loadDivision();
    await locationController.loadDistrict();
    await locationController.loadSubDistrict();


    await locationController.getAllAddress();

    print('-------------> address List length : ${locationController.addressList.length}');


    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      if(!overallController.isDidChangeDependencies.value){

        overallController.isDidChangeDependencies.value = true;
      }
    });
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: widget.totalScreenWidth * 0.7,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            text: 'Address List',
            size: 16,
            weight: FontWeight.w500,
            color: TEXT_DARK.withOpacity(0.9),
          ),
          Obx((){
            if(locationController.addressList.isEmpty){
              return const SizedBox(height: 10,);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const SizedBox(height: 10,),
                ...locationController.addressList.asMap().entries.map((e){
                  print(e.value.division);
                  return Container(
                    width: (widget.totalScreenWidth * 0.7) * 0.88,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Card(
                      elevation: 0,
                      child: Wrap(
                        children: [
                          CustomRichText(titleText: 'Name : ', valueText: e.value.receiverName!),const SizedBox(width: 20,),
                          CustomRichText(titleText: 'Email : ', valueText: e.value.email!),const SizedBox(width: 20,),
                          CustomRichText(titleText: 'Mobile : ', valueText: e.value.phoneNumber!),const SizedBox(width: 20,),
                          CustomRichText(titleText: 'Division : ', valueText: '${e.value.division}'),const SizedBox(width: 20,),
                          CustomRichText(titleText: 'District : ', valueText: '${e.value.district}'),const SizedBox(width: 20,),
                          CustomRichText(titleText: 'Sub District : ', valueText: '${e.value.subDistrict}'),const SizedBox(width: 20,),
                          CustomRichText(titleText: 'Details : ', valueText: '${e.value.details}'),const SizedBox(width: 20,),
                        ],
                      ),
                    ),
                  );
                })
              ],
            );
          }),

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
                ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Future<void> _addressAlertDialog(BuildContext context) async {
    locationController.selectedAddress.value.isDefault=false;
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
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Obx(() {
                      if (overallController.isValidatedAddressTextField.value) {
                        return const SizedBox.shrink();
                      }
                      return CustomText(
                        text: 'Required all fields with valid input!',
                        size: 16,
                        color: TEXT_RED.withOpacity(0.8),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            textFormFieldWithController(
                                hint: 'Name',
                                hintDisable: true,
                                controller: nameTextEditingController),
                            // CustomText(text: 'Mobile Number'),
                            const SizedBox(
                              height: 15,
                            ),
                            textFormFieldWithController(
                                hint: 'Mobile Number',
                                hintDisable: true,
                                controller: phoneTextEditingController),
                            const SizedBox(
                              height: 15,
                            ),
                            // if (locationController.division.isNotEmpty)
                            //   Obx(()=>locationSelectDropDown(isDivision: true)),

                            // select division
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: outlineInputBorder(),
                                focusedBorder: outlineInputBorder(),
                                enabledBorder: outlineInputBorder(),
                              ),
                              isExpanded: true,
                              value: overallController.selectDivisionName.value,
                              // value: 'বিভাগ',
                              hint: CustomText(
                                  text: overallController
                                      .selectDivisionName.value),
                              items: [
                                const DropdownMenuItem(
                                  value: 'Division',
                                  child: CustomText(
                                    text: 'Division',
                                  ),
                                ),
                                ...locationController.division.map(
                                  (e) => DropdownMenuItem<String>(
                                    value: e.name,
                                    child: CustomText(
                                      text: e.name!,
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (value) async {
                                if (value !=
                                    overallController
                                        .selectDivisionName.value) {
                                  overallController.selectDistrictName.value =
                                      'District';
                                  overallController
                                      .selectSubDistrictName.value = 'Sub District';
                                  overallController.isDivisionChange.value =
                                      true;
                                  overallController.selectDivisionName.value =
                                      value!;
                                  await locationController.reloadLocationData(
                                      isDivision: true, value: value);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            // select district
                            SizedBox(
                              child: Obx(() {
                                if (overallController.isDivisionChange.value) {
                                  return const CircularProgressIndicator();
                                }
                                return DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: outlineInputBorder(),
                                    focusedBorder: outlineInputBorder(),
                                    enabledBorder: outlineInputBorder(),
                                  ),
                                  isExpanded: true,
                                  value: overallController
                                      .selectDistrictName.value,
                                  // value: 'জেলা',
                                  hint: CustomText(
                                      text: overallController
                                          .selectDistrictName.value),
                                  items: [
                                    const DropdownMenuItem(
                                      value: 'District',
                                      child: CustomText(
                                        text: 'District',
                                      ),
                                    ),
                                    ...locationController.district.map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e.name,
                                        child: CustomText(
                                          text: e.name!,
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) async {
                                    if (value !=
                                        overallController
                                            .selectDistrictName.value) {
                                      overallController.selectSubDistrictName
                                          .value = 'Sub District';
                                      overallController.isDistrictChange.value =
                                          true;
                                      overallController
                                          .selectDistrictName.value = value!;
                                      // locationController.subDistrict.clear();
                                      await locationController
                                          .reloadLocationData(
                                              isDistrict: true, value: value);
                                    }
                                  },
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            // select sub district
                            SizedBox(
                              child: Obx(() {
                                if (overallController.isDistrictChange.value ||
                                    overallController.isDivisionChange.value) {
                                  return CircularProgressIndicator();
                                }
                                return DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: outlineInputBorder(),
                                    focusedBorder: outlineInputBorder(),
                                    enabledBorder: outlineInputBorder(),
                                  ),
                                  isExpanded: true,
                                  // value: 'উপজেলা',
                                  value: overallController
                                      .selectSubDistrictName.value,
                                  hint: CustomText(
                                      text: overallController
                                          .selectSubDistrictName.value),
                                  items: [
                                    const DropdownMenuItem(
                                      value: 'Sub District',
                                      child: CustomText(
                                        text: 'Sub District',
                                      ),
                                    ),
                                    ...locationController.subDistrict.map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e.name,
                                        child: CustomText(
                                          text: e.name!,
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) async {
                                    if (value !=
                                        overallController
                                            .selectSubDistrictName.value) {
                                      // locationController.subDistrict.clear();
                                      // locationController.district.clear();
                                      // await locationController.reloadLocationData(
                                      //     isSubDistrict: true, value: value!);
                                    }
                                    overallController
                                        .selectSubDistrictName.value = value!;
                                  },
                                );
                              }),
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: (screenSize.width * 0.5) * 0.45,
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: ((screenSize.width * 0.5) * 0.45) - 20,
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 1.2,
                                  color: TEXT_FIELD_BORDER,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CustomText(
                                    text: 'Set as default address',
                                    size: 16,
                                    weight: FontWeight.w500,
                                    color: TEXT_DARK,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      locationController.setDefaultAddress.value = !locationController.setDefaultAddress.value;

                                      locationController.selectedAddress.value.isDefault = locationController.setDefaultAddress.value;
                                    },
                                    child: Obx(() {
                                      if (locationController.setDefaultAddress.value) {
                                        return const Icon(
                                            Icons.toggle_on_outlined,
                                            size: 40,
                                            color:TEXT_GREEN
                                        );
                                      }
                                      return const Icon(
                                          Icons.toggle_off_outlined,
                                          size: 40,
                                          color:TEXT_RED
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            textFormFieldWithController(
                              controller: emailTextEditingController,
                              hint: 'Email',
                              hintDisable: true,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: detailsTextEditingController,
                              keyboardType: TextInputType.multiline,
                              minLines: 3,
                              maxLines: 7,
                              validator: (value) {},
                              decoration: InputDecoration(
                                hintText: "Details",
                                labelText: "Details",
                                border: outlineInputBorder(enable: true),
                                focusedBorder: outlineInputBorder(enable: true),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: customActionButton(
                          onTap: () async {
                            // save address

                            if (nameTextEditingController.text.trim().length <
                                    3 ||
                                emailTextEditingController.text.trim().length <
                                    15 ||
                                phoneTextEditingController.text.trim().length <
                                    11 ||
                                overallController.selectDivisionName.value
                                    .contains('Division') ||
                                overallController.selectDivisionName.value
                                    .contains('District') ||
                                overallController.selectDivisionName.value
                                    .contains('Sub District')) {
                              overallController
                                  .isValidatedAddressTextField.value = false;
                              return;
                            }
                            overallController
                                .isValidatedAddressTextField.value = true;

                            // print('${nameTextEditingController.text}\n${phoneTextEditingController.text}\n${detailsTextEditingController.text}');
                            // print('${overallController.selectDivisionName.value}');
                            // print('${overallController.selectDistrictName.value}');
                            // print('${overallController.selectSubDistrictName.value}');

                            locationController
                                    .selectedAddress.value.receiverName =
                                nameTextEditingController.text.trim();
                            locationController.selectedAddress.value.email =
                                emailTextEditingController.text.trim();
                            locationController
                                    .selectedAddress.value.phoneNumber =
                                phoneTextEditingController.text.trim();
                            locationController.selectedAddress.value.details =
                                detailsTextEditingController.text.trim();
                            locationController.selectedAddress.value.division =
                                overallController.selectDivisionName.value;
                            locationController.selectedAddress.value.district =
                                overallController.selectDistrictName.value;
                            locationController
                                    .selectedAddress.value.subDistrict =
                                overallController.selectSubDistrictName.value;

                            // print(jsonEncode(
                            //     locationController.selectedAddress.value));
                            await locationController.addAddress(
                                locationController.selectedAddress.value);


                            if(mounted){
                              Navigator.of(context).pop();
                            }

                          },
                          title: 'Save'),
                    ),
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
