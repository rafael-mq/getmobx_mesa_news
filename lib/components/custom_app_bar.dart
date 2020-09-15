import 'package:flutter/material.dart';

customAppBar({Color backgroundColor, String title, List<Widget> actions, Widget leading}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Color(0xff010a53),
    title: Text("$title"),
    centerTitle: true,
    actions: actions,
    leading: leading,
  );
}
