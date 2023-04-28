import 'dart:convert';

import 'package:docter_app/UserListModel.dart';
import 'package:docter_app/exceptions/app_exceptions.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<UserListModel> getUser() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return UserListModel.fromJson(data);
    } else {
      return throw AppException('_message', '_prefix');
    }
  }
}
