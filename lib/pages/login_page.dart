import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/components/custom_app_bar.dart';
import 'package:getmobx_mesa_news/components/custom_text_field.dart';
import 'package:getmobx_mesa_news/components/loading_view.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _renderErrorMessage(LoginStore store) {
    if (store.errorMessage.isEmpty) {
      return Container();
    }

    return ListTile(
      title: Container(
        margin: EdgeInsets.only(top: 25.0, left: 5.0, right: 5.0),
        child: Text(
          store.errorMessage,
          style: TextStyle(
            color: Colors.red,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget renderBody(LoginStore store) {
    return Observer(builder: (_) {
      if (store.isLoading) {
        return LoadingView();
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  'assets/login.png',
                  width: 150.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: CustomTextField(
                  label: "Email",
                  onChanged: (value) => store.loginForm.changeEmail(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: CustomTextField(
                  obscure: true,
                  label: "Senha",
                  onChanged: (value) => store.loginForm.changePassword(value),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: () {
                    store.doLogin();
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
              _renderErrorMessage(store),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  onPressed: () => print('onLogin'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: Text(
                    "Entrar com facebook",
                  ),
                  color: Colors.white,
                  textColor: Theme.of(context).primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Não tenho conta.",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed("/register"),
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = Get.put(LoginStore(), permanent: true);

    return Container(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: customAppBar(
            title: "Entrar com e-mail",
            leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => print("close pressed")),
          ),
          body: renderBody(store)),
    );
  }
}
