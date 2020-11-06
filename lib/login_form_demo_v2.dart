import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_login.dart';
import 'page_main.dart';
import 'state_simple.dart';

/*
     -----------------------------------------------------------------
      로그인 라우팅 초기화면
     -----------------------------------------------------------------
 */

void main() => runApp(loginFormApp);

// ChangeNotifierProvider는 단일 모델을 제공하는 역활
// 다수의 모델에 접근 하려면 MultiProvider 클래스를 사용 해야 함.
//
var loginFormApp = ChangeNotifierProvider(
  builder: (context) => SimpleState(),
  child: StateLoginDemo(),
);

const String ROOT_PAGE = '/';
const String MAIN_PAGE = '/main';

class StateLoginDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '로그인 폼',
      debugShowCheckedModeBanner: false,
      // 최초라우팅
      initialRoute: ROOT_PAGE,
      routes: {
        ROOT_PAGE: (context) => LoginPage(),
        MAIN_PAGE: (context) => MainPage(),
      },
    );
  }
}
