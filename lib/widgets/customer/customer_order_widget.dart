import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/order_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomerOrderedWidget extends StatefulWidget {
  final double totalScreenWidth;
  const CustomerOrderedWidget({Key? key, required this.totalScreenWidth})
      : super(key: key);

  @override
  State<CustomerOrderedWidget> createState() => _CustomerOrderedWidgetState();
}

class _CustomerOrderedWidgetState extends State<CustomerOrderedWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = widget.totalScreenWidth * 0.7;
    return Container(
      width: widget.totalScreenWidth * 0.7,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...orderList.asMap().entries.map((e){
            return _orderCard(context,width: width, order : e.value);
          })
        ],
      ),
    );
  }

  Widget _orderCard(BuildContext context, {required double width,required OrderModel order}){
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Order',
                        size: 16,
                        color: TEXT_DARK.withOpacity(0.8),
                      ),
                      InkWell(
                        onTap: () {
                          // go for manage order
                        },
                        child: CustomText(
                          text: ' #${order.id}',
                          size: 16,
                          color: TEXT_LINK,
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    text: '${order.date}',
                    size: 15,
                    color: TEXT_DARK,
                  )
                ],
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1.4,
              color: BORDER_GREY,
            ),
            Column(
              children: [
                ...order.productList!.asMap().entries.map((product){
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        loadImage(imageUrl: '${product.value.imageUrl}', width: 200, height: 160),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: CustomText(
                            text:
                            '${product.value.title}',
                            size: 16,
                            color: TEXT_DARK.withOpacity(0.8),
                            weight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        CustomText(
                          text: 'Qty : ${product.value.quantity}',
                          size: 16,
                          color: TEXT_DARK.withOpacity(0.8),
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: BG_BUTTON,
                          ),
                          child: CustomText(
                            text: '${order.status}',
                            size: 16,
                            color: TEXT_WHITE.withOpacity(0.8),
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
