import 'package:flutter/material.dart';

extension AppNavigator on BuildContext {
  void push({required String route, dynamic arguments}) {
    Navigator.pushNamed(this, route);
  }

  void replace({required String route, dynamic arguments}) {
    Navigator.pushReplacementNamed(this, route);
  }

  void pushAndRemove({required String route, dynamic arguments}) {
    Navigator.pushNamedAndRemoveUntil(this, route, (route) {
      return false;
    }, arguments: arguments);
  }

  void pop(dynamic arguments) {
    return Navigator.pop(this, arguments);
  }
}
