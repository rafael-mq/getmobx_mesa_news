import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/components/loading_view.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = Get.put(LoginStore());

  Widget _textField({String label, Function onChanged, bool obscure: false}) {
    return TextField(
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Color(0xFFF0F0F0)),
    );
  }

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

  Widget renderBody() {
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
                child: _textField(
                  label: "Email",
                  onChanged: (value) => store.loginForm.changeEmail(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: _textField(
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
                  child: Text(
                    "Login",
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
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Não tenho conta.",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    InkWell(
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
