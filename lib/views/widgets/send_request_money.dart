import 'package:flutter/material.dart';
import 'package:pear_monie/views/widgets/text_widget.dart';

import '../../utils/colors.dart';

class SendRequestMoneyButton extends StatelessWidget {
  final String text;
  
  const SendRequestMoneyButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: borderColor
        )
      ),
      child:  Center(child:TextWidget(text: text,
        color: borderColor,fontWeight: FontWeight.bold,)),
    );
  }
}
