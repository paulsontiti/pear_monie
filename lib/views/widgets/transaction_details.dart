import 'package:flutter/material.dart';
import 'package:pear_monie/utils/colors.dart';
import 'package:pear_monie/utils/dimensions.dart';
import 'package:pear_monie/views/widgets/text_widget.dart';

import '../../data/models/transaction.dart';

class TransactionDetails extends StatelessWidget {
  final Color bgColor;
  final Transaction transaction;
  const TransactionDetails({super.key, required this.bgColor, required this.transaction});


  Color colorByTransactionType() {
    return  switch( transaction.transactionType){
      TransactionType.debit => Colors.orange,
      TransactionType.credit => successColor,
      _=> Colors.red
    };
  }

  String textByTransactionType() {
    return  switch( transaction.transactionType){
      TransactionType.debit => 'Debit',
      TransactionType.credit => 'Credit',
      _=> 'Failed'
    };
  }

  Icon iconByTransactionType() {
    return  switch( transaction.transactionType){
      TransactionType.debit =>  const Icon(Icons.outgoing_mail),
      TransactionType.credit => const Icon(Icons.info,color:Colors.white),
      _=>  const Icon(Icons.sms_failed,color:Colors.white)
    };
  }
  @override
  Widget build(BuildContext context) {

    return Container(
        color: bgColor,
      height: Dimensions.height100,
      margin:  EdgeInsets.only(bottom: Dimensions.height10),
      padding:  EdgeInsets.all(Dimensions.height15),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image: AssetImage(transaction.userImage)
                    ),
                    //color: successColor
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: transaction.userName),
                    const SizedBox(height: 5,),
                    Container(
                      height: 35,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: colorByTransactionType(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        iconByTransactionType(),

                          const SizedBox(width: 5,),
                          TextWidget(text: textByTransactionType()),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            TextWidget(text: "${transaction.currency} ${transaction.amount}"
              ,color: colorByTransactionType(),)
        ],
      ),
    );
  }
}
