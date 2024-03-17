import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pear_monie/utils/validation.dart';
import 'package:provider/provider.dart';

import '../data/models/user.dart';
import '../data/providers/user_provider.dart';

import 'package:http/http.dart' as http;

import '../views/screens/home_screen.dart';
import '../views/screens/login_screen.dart';
class HttpClient{
   static Future<String> loginUser(
       dynamic context,
       String userName,
       String password,
       ) async {
     if (userName.isEmpty || password.isEmpty) {
      return 'Please enter your username and password';
     }

     http.Client client = http.Client();
     try {
       http.Response response = await client.post(
           Uri.https('crypto-wallet-server.mock.beeceptor.com', 'api/v1/login'),
           body: {"username": userName, "password": password});

       var decodedResponse = jsonDecode(response.body);

       UserProvider userProvider = Provider.of(context, listen: false);
       userProvider.setUser = UserModel(
           username: userName, email: '', token: decodedResponse['access_token']);
      return 'success';
     } catch (e) {
      return "An error occurred. Please ensure you are connected to the internet";
     } finally {
       client.close();
     }
   }

   static Future<String> signUpUser(
        String email, String password, String userName) async {
     if (userName.isEmpty || !validateEmail(email) || password.isEmpty) {

       return 'Please enter a valid email, your username and password';
     }
     http.Client client = http.Client();
     try {
       http.Response response = await client.post(
           Uri.https('crypto-wallet-server.mock.beeceptor.com', 'api/v1/register'),
           body: {"email": email, "username": userName, "password": password});
       return "success";
     } catch (e) {
      return"An error occurred. Please ensure you are connected to the internet";
     } finally {
       client.close();
     }
   }

}



