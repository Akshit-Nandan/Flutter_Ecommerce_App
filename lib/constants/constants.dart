import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: Colors.red,
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.only(left: 7),
                child: Text("Loading..."),
              )
            ],
          ),
        );
      },
    ),
  );

  showDialog(
      context: context, builder: (context) => alert, barrierDismissible: false);
}

bool validateLogin(String email, String password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage("Email and Password both are compulsory !");
    return false;
  }
  if (email.isEmpty) {
    showMessage("Email is can't be empty !");
    return false;
  }
  if (password.isEmpty) {
    showMessage("Password is can't be empty !");
    return false;
  }
  return true;
}
bool validateSignUp(String name,String email, String password,String confPassword) {

  if (name.isEmpty) {
    showMessage("Name is can't be empty !");
    return false;
  }
  if (email.isEmpty) {
    showMessage("Email is can't be empty !");
    return false;
  }
  if (password.isEmpty) {
    showMessage("Password is can't be empty !");
    return false;
  }
  if (confPassword != password) {
    showMessage("Passwords are not matching !");
    return false;
  }
  return true;
}
