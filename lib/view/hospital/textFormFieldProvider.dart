
import 'package:docter_app/UserListModel.dart';
import 'package:docter_app/repository.dart';
import 'package:flutter/material.dart';

class textFormField extends ChangeNotifier {
  Repository repository = Repository();
  var _controller = TextEditingController();
  var focus = FocusNode();
  // ignore: prefer_typing_uninitialized_variables
  var _user;
  dynamic get user => _user;
  TextEditingController get controller => _controller;
  void setController(String value) {
    _controller.value;
    notifyListeners();
  }

  Future<void> getUser() async {
    _user = repository.getUser();
    notifyListeners();
  }
}
