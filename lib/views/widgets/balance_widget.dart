import 'package:flutter/material.dart';
import 'package:pear_monie/utils/colors.dart';
import 'package:pear_monie/views/widgets/text_widget.dart';

import '../../utils/wallet.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({super.key});

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  double balance = 0.0;
  String currency = '';
  bool fetchingData = true;
  @override
  void initState() {

    super.initState();
    fetchData();
  }

  fetchData()async{
    //fetchUserTransactions();
    ({double balance,String currency}) wallet = await fetchUserBalance();
    setState(() {
      balance = wallet.balance;
      currency = wallet.currency;
      fetchingData = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return fetchingData ?
    const CircularProgressIndicator(color: secondaryColor,)  :
    TextWidget(text: '$currency ${balance.toString()}',fontWeight: FontWeight.bold,
      fontSize: 30,);
  }
}
