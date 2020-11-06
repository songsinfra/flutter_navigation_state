import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state_simple.dart';

/*
     -----------------------------------------------------------------
      로그인 완료 후 메인 페이지
     -----------------------------------------------------------------
 */
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Consumer<SimpleState>를 선언 하여 지정 처리
        child: Consumer<SimpleState>(
          builder: (context, state, child) {
            return Text('로그인 완료: ${state.email}');
          },
        ),
      ),
    );
  }
}
