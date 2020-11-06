import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'page_contact_detail.dart';
import 'page_contact_list.dart';

/*
     -----------------------------------------------------------------
      초기 메인 화면
     -----------------------------------------------------------------
 */

void main() => runApp(ContactsDemoV3());

class ContactsDemoV3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        // 주소록 화면조회
        home: ContactListPage(),
        //동적으로 routes를 구성하기 위해서는 onGenerateRoute 속성을 구현 하여야 한다.
        // RouteSettings settings를 통하여 추가적인 정보를 다른 화면에 전달 할수 있다.
        // 한마디로 RoutesSettings 객체를 인자로받아서 Route(dynamic)을 반환 하는 함수이다.
        // RouteSettings에는 경로이름인 name과 새로운 페이지에 넘길 인자인 arguments 속성만
        // 알고 있으면 된다.
        onGenerateRoute: (RouteSettings settings) {
          print("settings.name?" + settings.name);

          //상세화면의 routeName과 리스트화면에서 넘겨진 settings.name이 동일 하다면...
          if (ContactDetailPage.routeName == settings.name) {
            Contact c = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => ContactDetailPage(c));
          }
          return _noWay;
        });
  }

  final MaterialPageRoute _noWay = MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('경로가 없습니다'),
      ),
    ),
  );
}
