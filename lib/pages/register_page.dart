import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';

class RegisterPage extends StatelessWidget {
  LoginStore store = Get.find();

  Widget renderBody() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Entrar com e-mail"),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => print("close pressed")),
          ),
          body: renderBody()),
    );
  }
}
