import 'package:flutter/material.dart';
import 'package:pear_monie/views/widgets/transaction_details.dart';

import '../../data/models/transaction.dart';
import '../../utils/colors.dart';
import '../../utils/transactions.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List transactions = [];
  bool fetchingData = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData()async{
    List data = await fetchUserTransactions();

 setState(() {
   transactions = data;
   fetchingData = false;
 });
  }

  @override
  Widget build(BuildContext context) {
    return fetchingData ? const CircularProgressIndicator(color: secondaryColor,) : ListView.builder(

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: ((context,index){
        var data = transactions[index];
        Transaction transaction = Transaction(
          id: data['id'],amount: data['amount'],source: data['from_wallet'] != null ? TransactionSource.fromwallet : TransactionSource.towallet,
          sourceId: data['from_wallet'] ?? data['to_wallet'],
          currency: data['currency'],timestamp: data['timestamp'],
            userImage: 'assets/dp.jpg',userName: 'John Doe',
          transactionType: data['type'] == 'credit' ? TransactionType.credit : TransactionType.debit
        );
        
        return  TransactionDetails(bgColor:
        index % 2 == 0 ? rowColor : const Color(0xff10194E), transaction: transaction);
      }),

    );
  }
}
