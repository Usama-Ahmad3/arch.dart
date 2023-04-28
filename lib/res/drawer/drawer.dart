import 'package:docter_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: FlexColor.lightScaffoldBackground,
    );
  }
}
