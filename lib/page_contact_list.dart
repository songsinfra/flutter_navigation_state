import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'page_contact_detail.dart';

/*
     -----------------------------------------------------------------
      주소록 리스트 조회 화면
     -----------------------------------------------------------------
 */

// 주소록 조회
class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Iterable<Contact> _contacts;

  @override
  void initState() {
    // 무조건 initState()안에서는 super.initState()를 선언 해야 한다.
    super.initState();
    refreshContacts();
  }

  //비동기로 실행 되며 폰에서 주소록을 조회 한다.
  refreshContacts() async {
    // 폰에서  주소록 정보를 조회 한다.
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    // 주소록 정보를 가져왔다면 상태값을 변경하며 지역변수 _contacts에 값을 전달 한다.

    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('주소록 데모')),
        body: _contacts != null
            ? ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: _buildRow,
              )
            : Center(child: CircularProgressIndicator()));
  }

  Widget _buildRow(BuildContext context, int i) {
    Contact c = _contacts.elementAt(i);
    return ListTile(
      leading: (c.avatar != null && c.avatar.length > 0)
          ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
          : CircleAvatar(child: Text(c.initials())),
      title: Text(c.displayName ?? ""),

      // PushNamed에 해당 URL을 동적으로정의 한다.
      // /contact 을 정의 하여 넘기면
      // settings.name에 값이 정의 된다.
      onTap: () => Navigator.pushNamed(context, ContactDetailPage.routeName,
          arguments: c),
    );
  }
}
