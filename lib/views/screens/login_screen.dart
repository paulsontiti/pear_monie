import 'package:flutter/material.dart';
import 'package:pear_monie/utils/colors.dart';
import 'package:pear_monie/utils/http_client.dart';
import 'package:pear_monie/views/screens/home_screen.dart';
import 'package:pear_monie/views/screens/signup_screen.dart';
import 'package:pear_monie/views/widgets/text_widget.dart';

import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  bool isLoading = false;
  Color userNameBorderColor = Colors.white;
  Color passwordBorderColor = Colors.white;
  Color userNameFocusedBorderColor = successColor;
  Color passwordFocusedBorderColor = successColor;

  void login(context) async {
    setState(() {
      isLoading = true;
    });
    String msg = await HttpClient.loginUser(
      context,
      userNameEditingController.text,
      passwordEditingController.text,
    );

    setState(() {
      isLoading = false;
    });
    if(msg == 'success'){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
          Text('Login was successfull')));
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const HomeScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content:
          Text(msg)));
    }
  }

  void navigateToSignUpScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  @override
  void dispose() {
    super.dispose();
    userNameEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width =
        MediaQuery.of(context).size.width > 600 ? 600 : double.infinity;
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              const TextWidget(
                  text: "Login here",
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              const SizedBox(
                height: 24,
              ),
              const TextWidget(text: "Welcome back, you have been missed"),
              const SizedBox(
                height: 64,
              ),
              TextFieldInput(
                focusedBorderColor: userNameFocusedBorderColor,
                hintText: "john",
                labelText: 'Username',
                textEditingController: userNameEditingController,
                textInputType: TextInputType.text,
                borderColor: userNameBorderColor,
                onChanged: (_) {
                  setState(() {
                    userNameBorderColor = userNameEditingController.text.isEmpty
                        ? secondaryColor
                        : Colors.white;
                    userNameFocusedBorderColor =
                        userNameEditingController.text.isEmpty
                            ? secondaryColor
                            : successColor;
                  });

                  return;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFieldInput(
                focusedBorderColor: passwordFocusedBorderColor,
                hintText: "",
                labelText: 'Password',
                textEditingController: passwordEditingController,
                textInputType: TextInputType.text,
                isPassword: true,
                borderColor: passwordBorderColor,
                onChanged: (_) {
                  setState(() {
                    passwordBorderColor = passwordEditingController.text.isEmpty
                        ? secondaryColor
                        : Colors.white;
                    passwordFocusedBorderColor =
                        passwordEditingController.text.isEmpty
                            ? secondaryColor
                            : successColor;
                  });

                  return;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  login(context);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      color: bgColorShade,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const TextWidget(
                          text: "Login",
                          fontWeight: FontWeight.bold,
                          color: bgColorShadeTextColor,
                        ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: const TextWidget(
                      text: "Don't have an account?",
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToSignUpScreen,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: TextWidget(
                        text: "Sign Up",
                        color: bgColorShadeTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(flex: 2, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
