import 'package:flutter/material.dart';
import 'package:pear_monie/utils/colors.dart';
import 'package:pear_monie/utils/http_client.dart';
import 'package:pear_monie/utils/validation.dart';
import 'package:pear_monie/views/widgets/text_widget.dart';

import '../widgets/text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _usernameEditingController =
      TextEditingController();

  bool _isLoading = false;
  Color userNameBorderColor = Colors.white;
  Color passwordBorderColor = Colors.white;
  Color emailBorderColor = Colors.white;
  Color userNameFocusedBorderColor = successColor;
  Color passwordFocusedBorderColor = successColor;
  Color emailFocusedBorderColor = successColor;

  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _usernameEditingController.dispose();
  }

  void navigateToLoginpScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  signUp(dynamic context) async {
    setState(() {
      _isLoading = true;
    });
   String msg = await HttpClient.signUpUser(_emailEditingController.text,
        _passwordEditingController.text,
       _usernameEditingController.text);
    if(msg == 'success'){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
          Text("Registration was successful.")));
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const LoginScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content:
          Text(msg)));
    }
   setState(() {
      _isLoading = false;
    });
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
                  text: "Create account",
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 12,
              ),
              TextFieldInput(
                focusedBorderColor: emailFocusedBorderColor,
                hintText: "john@gmail.com",
                labelText: 'Email',
                textEditingController: _emailEditingController,
                textInputType: TextInputType.emailAddress,
                borderColor: emailBorderColor,
                onChanged: (userName) {
                  setState(() {
                    emailBorderColor =
                        !validateEmail(_emailEditingController.text)
                            ? secondaryColor
                            : Colors.white;
                    emailFocusedBorderColor =
                        !validateEmail(_emailEditingController.text)
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
                  focusedBorderColor: userNameFocusedBorderColor,
                  hintText: "johnny",
                  labelText: 'Username',
                  textEditingController: _usernameEditingController,
                  textInputType: TextInputType.text,
                  borderColor: userNameBorderColor,
                  onChanged: (userName) {
                    setState(() {
                      userNameBorderColor =
                          _usernameEditingController.text.isEmpty
                              ? secondaryColor
                              : Colors.white;
                      userNameFocusedBorderColor =
                          _usernameEditingController.text.isEmpty
                              ? secondaryColor
                              : successColor;
                    });

                    return;
                  }),
              const SizedBox(
                height: 12,
              ),
              TextFieldInput(
                  focusedBorderColor: passwordFocusedBorderColor,
                  helperText: 'Your password should be at least 8 characters',
                  hintText: "23@ryT45#ghwq",
                  labelText: 'Password',
                  textEditingController: _passwordEditingController,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  borderColor: passwordBorderColor,
                  onChanged: (userName) {
                    setState(() {
                      passwordBorderColor =
                          !validatePassword(_passwordEditingController.text)
                              ? secondaryColor
                              : Colors.white;
                      passwordFocusedBorderColor =
                          !validatePassword(_passwordEditingController.text)
                              ? secondaryColor
                              : successColor;
                    });

                    return;
                  }),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  signUp(context);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      color: bgColorShade,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const TextWidget(
                          text: "Sign up",
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
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const TextWidget(
                      text: "Already has an account?",
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToLoginpScreen,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: TextWidget(
                        text: "Login",
                        fontWeight: FontWeight.bold,
                        color: bgColorShadeTextColor,
                      ),
                    ),
                  )
                ],
              ),
              Flexible(flex: 2, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
