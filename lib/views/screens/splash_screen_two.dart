
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pear_monie/views/screens/splash_screen.dart';



class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenTwo>
    with SingleTickerProviderStateMixin {
  //widget variables

  //overrides
  @override
  void initState() {
    super.initState();

    //change current page value

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/splash_two.png'))
        ),

      ),
    );
  }
}
