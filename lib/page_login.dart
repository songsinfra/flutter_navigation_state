import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

/*
     -----------------------------------------------------------------
      로그인 페이지
     -----------------------------------------------------------------
 */

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController(text: 'your_name@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'input password');

  void _onLogin(BuildContext context) {
    final String email = _emailController.text;
    // Provider.of를 썼음을 기억하자.
    final SimpleState state = Provider.of<SimpleState>(context);

    //로그인 한 이메일을 셋팅 하여 전달 한다.
    state.setEmail(email);
    // 이동 처리
    Navigator.pushNamed(context, MAIN_PAGE);
  }

  void _onCancel() => exit(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
          child: Column(
            children: <Widget>[
              Hero(
                  tag: 'heoro',
                  child: CircleAvatar(
                    child: Image.asset('assets/logo.jpg'),
                    backgroundColor: Colors.transparent,
                    radius: 58.0, //unit: logical pixel?
                  )),
              SizedBox(height: 45.0),
              TextFormField(
                key: Key('email'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: _emailController,
              ),
              SizedBox(height: 15.0),
              TextFormField(
                key: Key('password'),
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: _passwordController,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    key: Key('login'),
                    child: Text('로그인'),
                    onPressed: () => _onLogin(context),
                  ),
                  SizedBox(width: 10.0),
                  RaisedButton(
                    key: Key('cancel'),
                    child: Text('취소'),
                    onPressed: _onCancel,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
