import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

Future<List> fetchUserTransactions() async{
    List transactions =  [];
  http.Client client = http.Client();
  try {
    http.Response response = await client.get(
        Uri.https('crypto-wallet-server.mock.beeceptor.com',
            'api/v1/transactions'),
        );
    transactions = (jsonDecode(response.body) as  Map)['transactions'];
    return transactions;
  }catch(e) {
    debugPrint(e.toString());
  }finally {
    client.close();
  }
  return transactions;
}