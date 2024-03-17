import 'package:flutter/material.dart';
import 'package:pear_monie/utils/colors.dart';
import 'package:pear_monie/utils/dimensions.dart';
import 'package:pear_monie/views/screens/login_screen.dart';
import 'package:pear_monie/views/widgets/balance_widget.dart';
import 'package:pear_monie/views/widgets/home_header.dart';
import 'package:pear_monie/views/widgets/send_request_money.dart';
import 'package:pear_monie/views/widgets/text_widget.dart';
import 'package:pear_monie/views/widgets/transactions.dart';
import 'package:provider/provider.dart';

import '../../data/models/user.dart';
import '../../data/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UserModel? currentUser = Provider.of<UserProvider>(context).getUser;

    return currentUser != null
        ? Scaffold(
            body: Column(
              children: [
                HomeHeader(
                  username: currentUser.username,
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget(text: 'Your current balance is'),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              const BalanceWidget(),
                              SizedBox(
                                height: Dimensions.height20 * 1.5,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SendRequestMoneyButton(text: "Request money"),
                                  SendRequestMoneyButton(text: "Send money"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20 * 1.5,
                        ),
                        Container(
                          //height: Dimensions.height100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Dimensions.width20),
                                  topRight:
                                      Radius.circular(Dimensions.width20)),
                              color: const Color(0xff10194E)),
                          child: Column(
                            children: [
                              Container(
                                height: Dimensions.height5,
                                width: Dimensions.width50,
                                margin: EdgeInsets.all(Dimensions.height20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.width50),
                                    color: dotButtonColor),
                              ),
                              //SizedBox(height: Dimensions.height15*2,),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextWidget(
                                      text: 'All Transactions',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Row(
                                      children: [
                                        const TextWidget(
                                          text: 'Sort by:',
                                          color: dotButtonColor,
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        const TextWidget(text: 'Recent'),
                                        const Icon(
                                          Icons.arrow_drop_down_sharp,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height20 * 1.5,
                              ),
                              const Transactions(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : const LoginScreen();
  }
}
