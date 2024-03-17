import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


Future<({double balance,String currency})> fetchUserBalance() async{

  http.Client client = http.Client();
  try {
    http.Response response = await client.get(
        Uri.https('crypto-wallet-server.mock.beeceptor.com',
            'api/v1/balance'),
       );
    var decodedResponse = jsonDecode(response.body) as Map;
   return (balance:decodedResponse["balance"] as double,currency : decodedResponse["currency"] as String);
  }catch(e) {
    debugPrint(e.toString());
  }finally {
    client.close();
  }
  return (balance: 0.0,currency:'');
}