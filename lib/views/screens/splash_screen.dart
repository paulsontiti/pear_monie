import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pear_monie/utils/colors.dart';
import 'package:pear_monie/utils/dimensions.dart';
import 'package:pear_monie/views/widgets/splash_page.dart';

import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //widget variables
  PageController pageController = PageController();
  int currentPageValue = 0;
  int countOfPageItems = 2;


  //methods
  List<Widget> generateSplashPages(){
    Color textColor =  currentPageValue == 0  ?
    Colors.white : splashScreenOneColor;
    Color bgColor = currentPageValue == 1  ?
    Colors.white : splashScreenOneColor;
    return [
      SplashPage(title: 'Transfer that is safe',
          message: 'You have nothing to be scared about, we got you covered.',
          textColor:textColor,
          bgColor: bgColor),
      SplashPage(title: 'Transfer money with ease',
          message: 'making money is hard enough, we make transferring it easy enough.',
          textColor:textColor,
          bgColor: bgColor),

    ];
  }

  //overrides
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    //change current page value
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        currentPageValue = currentPageValue == countOfPageItems - 1 ? 0 : currentPageValue + 1;
      });
    });
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });

  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

  }

//slider builder
  Widget _buildPageItem(int index, int pageLength,List<Widget> pages) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'trending-dish-details');
      },
      child: pages[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryColor,bgColorShade,bgColorShadeTextColor,successColor,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.only(right: 40,left: 0),
            width: Dimensions.screenWidth < 600 ?
                    double.maxFinite : 600,
            height: MediaQuery.of(context).size.height * 0.32,
            decoration:  BoxDecoration(
                color: currentPageValue == 0 ? splashScreenOneColor : splashScreenTwoColor,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DotsIndicator(
                    dotsCount: countOfPageItems,
                    position: currentPageValue,
                    decorator: DotsDecorator(
                      color: const Color.fromARGB(255, 232, 176, 102),
                      activeColor: Colors.orange,
                      size: const Size(18.0, 9.0),
                      activeSize: const Size(38.0, 9.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                        itemCount: countOfPageItems,
                        controller: pageController,
                        itemBuilder: ((context, position) {
                          return _buildPageItem(currentPageValue, countOfPageItems,generateSplashPages());
                        })),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
