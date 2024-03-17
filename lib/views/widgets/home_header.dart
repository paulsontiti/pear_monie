import 'package:flutter/material.dart';
import 'package:pear_monie/utils/dimensions.dart';
import 'package:pear_monie/views/widgets/text_widget.dart';

import '../../utils/colors.dart';

class HomeHeader extends StatelessWidget {
  final String username;
  const HomeHeader({super.key, required this.username});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.only(top: 30,
          left:  Dimensions.width10,
          right: Dimensions.width10),
      child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(

          children: [
            InkWell(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: bgColorShade
                ),
                child: const Icon(Icons.menu,color: secondaryColor,),
              ),
            ),
             SizedBox(width: Dimensions.width10,),
             TextWidget(text: "Hello ${username.substring(0,1).toUpperCase()}${username.substring(1)},",fontSize: Dimensions.font16,fontWeight: FontWeight.bold,),
          ],
        ),
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgColorShade
          ),
          child: const Center(child:TextWidget(text: "Add money",
            color: bgColorShadeTextColor,fontWeight: FontWeight.bold,)),
        )
      ],
    ),);
  }
}
