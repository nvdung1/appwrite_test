import 'package:appwrite/appwrite.dart';
import 'package:appwrite_test/config/config.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier{
   Client client = Client();
   late Account account ;

  AuthState(){
    _init();
  }

  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    account = Account(client);
  }

   createAccount(String name, String email, String password) async {

    try {
      print("vao day");
      var result =
          await account.create(
              userId: 'mee.io123456987',
              email: 'me@appwrite.io',
              password: 'password',
              name: 'My Name'
          );
      print("xong");
      // ignore: unrelated_type_equality_checks
      if (result.status == 201) {
        print("vao day");

        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
    }
  }

}