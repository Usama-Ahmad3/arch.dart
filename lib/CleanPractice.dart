import 'package:docter_app/UserListModel.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  UserListModel user = UserListModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: user.data!.length,
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(user.data![index].firstName.toString()),
          subtitle: Text(user.data![index].email.toString()),
          leading: Text(user.data![index].id.toString()),
        );
      },
    ));
  }
}
