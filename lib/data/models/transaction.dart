class Transaction{
   final String id;
   final TransactionSource source;
   final String sourceId;
   final double amount;
   final String currency;
   final String timestamp;
   final TransactionType? transactionType;
   final String userName;
   final String userImage;
   Transaction({required this.id, required this.source,required this.sourceId,required this.amount,
     required this.currency,required this.timestamp,required this.transactionType,
     required this.userName,required this.userImage});
}

enum TransactionSource{
  fromwallet,
  towallet,
}

enum TransactionType{
  credit,
  debit,
}