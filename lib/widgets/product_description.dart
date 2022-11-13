import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDescription extends StatefulWidget {
  final String desc;
  const ProductDescription({Key? key, required this.desc}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Html(
      data: widget.desc,
      style: {
        "p" : Style(
          fontSize: const FontSize(17),
          fontWeight: FontWeight.w500,
        ),
      },
    );
  }
}
