
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get getUser => _user;
  set setUser(UserModel user){
    _user = user;
    notifyListeners();
  }



}
