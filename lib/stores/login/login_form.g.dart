// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginForm on _LoginFormBase, Store {
  Computed<Map<String, String>> _$credentialsComputed;

  @override
  Map<String, String> get credentials => (_$credentialsComputed ??=
          Computed<Map<String, String>>(() => super.credentials,
              name: '_LoginFormBase.credentials'))
      .value;

  final _$emailAtom = Atom(name: '_LoginFormBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginFormBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_LoginFormBaseActionController =
      ActionController(name: '_LoginFormBase');

  @override
  void changeEmail(dynamic value) {
    final _$actionInfo = _$_LoginFormBaseActionController.startAction(
        name: '_LoginFormBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_LoginFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePassword(dynamic value) {
    final _$actionInfo = _$_LoginFormBaseActionController.startAction(
        name: '_LoginFormBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_LoginFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
credentials: ${credentials}
    ''';
  }
}
