import 'package:get/get.dart';

enum BreakPoint{
  xs,sm,md,lg,xl,
}
class Dimensions {
  //device height
  static double screenHeight = Get.context!.height;
  //device width
  static double screenWidth = Get.context!.width;

  //breakpoint
  static BreakPoint getBreakPoint(){
   if(screenWidth > 300 && screenWidth < 600) return BreakPoint.sm;
   if(screenWidth > 600 && screenWidth < 900) return BreakPoint.md;
   if(screenWidth > 900 && screenWidth < 1200) return BreakPoint.lg;
   if(screenWidth > 1200) return BreakPoint.xl;
   return BreakPoint.xs;
  }

  //left margin/padding
  static double marginPaddingWidth(){
    return switch(Dimensions.getBreakPoint()){
      BreakPoint.xs => Dimensions.width10,
      BreakPoint.sm => Dimensions.width20,
      BreakPoint.md => Dimensions.width40,
      BreakPoint.lg => Dimensions.width50,
      _=> Dimensions.width50*1.5
    };
  }
  //dynamic height values
  static double height1Of2 = screenHeight / 2; //height = 1/2 of screen height
  static double height1Of3 = screenHeight / 3; //height = 1/3 of screen height
  static double height2Of5 = screenHeight / 2.5; //height = 2/5 of screen height
  static double height1Of5 = screenHeight / 5; //height = 1/5 of screen height
  static double height3Of5 =
      screenHeight / 1.67; //height = 3/5 of screen height
  static double height300 = screenHeight / 2.22; //height = 300
  static double height270 = screenHeight / 2.47; //height = 250
  static double height200 = screenHeight / 3.33; //height = 200
  static double height100 = screenHeight / 6.67; //height = 100
  static double height120 = screenHeight / 5.56; //height = 120
  static double height160 = screenHeight / 4.17; //height = 120
  static double height80 = screenHeight / 8.34; //height = 80
  static double height90 = screenHeight / 7.41; //height = 90
  static double height15 = screenHeight / 44.47; //height = 15
  static double height20 = screenHeight / 33.35; //height = 20
  static double height5 = screenHeight / 133.4; //height = 5
  static double height2 = screenHeight / 333.5; //height = 2
  static double height10 = screenHeight / 66.7; //height = 10
  static double height60 = screenHeight / 11.11; //height = 60
  static double height50 = screenHeight / 13.34; //height = 50

  //dynamic width for padding and margin
  static double width15 = screenWidth / 26; ////padding/margin = 15
  static double width20 = screenWidth / 19.5; ////padding/margin = 20
  static double width1Of3 = screenWidth / 3; //width = 1/3
  static double width2Of3 = screenWidth * (2 / 3); //width = 2/3
  static double width5 = screenWidth / 78; ////padding/margin = 5
  static double width10 = screenWidth / 39; ////padding/margin = 10
  static double width30 = screenWidth / 13; ////padding/margin = 30
  static double width40 = screenWidth / 9.75; ////padding/margin = 40
  static double width50 = screenWidth / 7.8; ////padding/margin = 30
  static double width25 = screenWidth / 15.6; //padding/margin = 25

  //dynamic radius values
  static double radius15 = screenHeight / 44.47; //radius = 15
  static double radius20 = screenHeight / 33.35; //radius = 20
  static double radius5 = screenHeight / 133.4; //radius = 5
  static double radius10 = screenHeight / 66.7; //radius = 10
  static double radius30 = screenHeight / 22.23; //radius = 10
  //dynamic font sizes
  static double font8 = screenHeight / 83.4; //fontSize = 8
  static double font12 = screenHeight / 55.58; //fontSize = 8
  static double font14 = screenHeight / 47.64; //fontSize = 8
  static double font16 = screenHeight / 41.69; //fontSize = 8
  static double font20 = screenHeight / 33.35; //fontSize = 8
  static double font24 = screenHeight / 27.8; //fontSize = 8
  static double font32 = screenHeight / 20.84; //fontSize = 8

  //dynamin iconsizes
  static double iconSize24 = screenHeight / 27.79; //icon size = 24
}
