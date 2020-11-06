import 'package:flutter/material.dart';

/*
     -----------------------------------------------------------------
      ChangeNotifier에 의하여 SimpleState 클래스는 자동 갱신 된다.
     -----------------------------------------------------------------
 */

class SimpleState extends ChangeNotifier {
  String _email;

  void setEmail(String email) {
    _email = email;
  }

  String get email => _email;
}
