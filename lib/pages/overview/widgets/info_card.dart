
import 'package:ecommercefrontend/constants/style.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color topColor;
  final bool isActive;
  final VoidCallback onTap;
  const InfoCard({Key? key,required this.title,required this.value,required this.topColor,required this.isActive,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 140,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0,6),
                color: lightGrey.withOpacity(0.1),
                blurRadius: 12,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: topColor ?? active,
                      height: 5,
                    ),
                  )
                ],
              ),
              Expanded(child: Container(),),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$title\n",
                      style: TextStyle(color: isActive ? active : lightGrey,fontSize: 16)
                    ),
                    TextSpan(
                      text: "$value",
                      style: TextStyle(color: isActive ? active : dark,fontSize: 36),
                    )
                  ]
                ),
              ),
              Expanded(child: Container(),),

            ],
          ),
        ),
      ),
    );
  }
}
