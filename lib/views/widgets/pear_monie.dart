import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pear_monie/utils/colors.dart';
import 'package:pear_monie/views/screens/home_screen.dart';
import 'package:pear_monie/views/screens/login_screen.dart';
import 'package:pear_monie/views/screens/splash_screen.dart';
import 'package:pear_monie/views/screens/splash_screen_one.dart';
import 'package:provider/provider.dart';

import '../../data/providers/user_provider.dart';

class PearMonie extends StatelessWidget {
  const PearMonie({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => UserProvider())
    ],
    child:  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,background: bgColor),

        useMaterial3: true,
      ),
      home: const SplashScreen(),
    ),
    );
  }
}
