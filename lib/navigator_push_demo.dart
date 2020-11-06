import 'package:flutter/material.dart';

void main() => runApp(NavigatorPushDemo());

class NavigatorPushDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  //push 새로운 화면 표시 , BuildContext는  flutter 내부의 객체 접근시 필요하다.
  //MaterialPageRoute는 화면전환 클래스이다. 어떤 화면으로 이동할지 구체적인 내용을 정의 할수 있다.
  // Nextpage는  새로운 페이지를 위미한다.

  // -------------------------------------------------------
  // "_showNextPage"는 메서드이다.
  // -------------------------------------------------------
  _showNextPage(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => NextPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 기본 데모'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _showNextPage(context),
          child: Text('다음 화면으로 이동'),
        ),
      ),
    );
  }
}

//독립적인 화면임으로  scaffold 위젯으로 시작
// _backToMainPage를 누르면  이전 페이지로 이동 한다.
class NextPage extends StatelessWidget {
  _backToMainPage(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다음 페이지'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _backToMainPage(context),
          child: Text('돌아가기'),
        ),
      ),
    );
  }
}
