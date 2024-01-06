import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();

  Future<dynamic> pushAndRemoveUntil(BuildContext context, Widget widget) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => widget), (route) => false);
  }
  Future<dynamic> push(BuildContext context, Widget widget) {
    return Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => widget));
  }
  Future<dynamic> pushReplacement(BuildContext context, Widget widget) {
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => widget));
  }
}
