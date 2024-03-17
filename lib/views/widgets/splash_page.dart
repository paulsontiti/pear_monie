import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final String title;
  final String message;
  final Color textColor;
  final Color bgColor;
  const SplashPage({super.key, required this.title, required this.message, required this.textColor, required this.bgColor,});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      padding: const EdgeInsets.only(top: 10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style:  TextStyle(color: textColor,
              fontWeight: FontWeight.bold,fontSize: 24),),
          const SizedBox(height: 5,),
          Text(message,style:  TextStyle(color: textColor),),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){},
            child:  Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: textColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Center(child:Text("Start banking",
                style: TextStyle(color: bgColor,
                    fontWeight: FontWeight.bold,
                fontSize: 18),),),
            ),
          ),

        ],
      ),
    );
  }
}
