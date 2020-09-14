import 'package:mobx/mobx.dart';

part 'login_form.g.dart';

class LoginForm = _LoginFormBase with _$LoginForm;

abstract class _LoginFormBase with Store {
  @observable
  String email;

  @observable
  String password;

  @computed
  Map<String, String> get credentials {
    return {
      "email": email,
      "password": password,
    };
  }

  @action
  void changeEmail(value) {
    email = value.trim();
  }

  String validateEmail() {
    // TODO implemetar validação de email
    return null;
  }

  @action
  void changePassword(value) {
    password = value;
  }

  String validatePassword() {
    // TODO implemetar validação de email
    return null;
  }
}
