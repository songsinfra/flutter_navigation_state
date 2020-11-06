import 'package:flutter/material.dart';
// routes를 정의하여 사용 한다.  페이지 경로를 지정할수 있다.

void main() => runApp(NavigatorRoutesDemo());

class NavigatorRoutesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/next': (context) => NextPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  //pushNamed를 사용 하였다는것에 주의.
  _showNextPage(BuildContext context) => Navigator.pushNamed(context, '/next');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Routes 데모'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _showNextPage(context),
          child: Text('상세 페이지로 이동'),
        ),
      ),
    );
  }
}

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
          child: Text('메인 페이지로 돌아가기'),
        ),
      ),
    );
  }
}
