import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/components/loading_view.dart';
import 'package:getmobx_mesa_news/components/custom_text_field.dart';
import 'package:getmobx_mesa_news/stores/login/register_store.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatelessWidget {
  final dateFormatter = MaskTextInputFormatter(mask: "##/##/####");

  processRegister(RegisterStore registerStore) async {
    print("processing register");
    final errorMsg = await registerStore.signUp();
    if (errorMsg.isEmpty) {
      print("register success");
      await Get.offNamed('/news');
    } else {
      print("fail to register");
      Get.snackbar(
        "Atenção",
        errorMsg,
        colorText: Colors.white,
        messageText: Text(
          errorMsg,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF0075FF),
      );
    }
  }

  Widget renderBody(RegisterStore registerStore) {
    return Observer(builder: (_) {
      if (registerStore.isLoading) {
        return LoadingView();
      }
      return Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: "Nome",
              onChanged: registerStore.changeName,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: "Email",
              onChanged: registerStore.changeEmail,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: "Senha",
              obscure: true,
              onChanged: registerStore.changePassword,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: "Confirmar Senha",
              obscure: true,
              onChanged: null,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              label: "Data de nascimento - opcional",
              formatters: [dateFormatter],
              // disabled: true,
              onChanged: null,
            ),
            SizedBox(
              height: 15,
            ),
            // RaisedButton(color: Colors.blue, onPressed: null, child: Text("Cadastrar"))
            SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: () => processRegister(registerStore),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  color: Color(0xff010a53),
                  textColor: Colors.white,
                )),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final registerStore = Get.put(RegisterStore());

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
              onPressed: () => Get.back(),
            ),
          ),
          body: renderBody(registerStore)),
    );
  }
}
