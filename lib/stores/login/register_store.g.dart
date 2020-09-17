// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStoreBase, Store {
  Computed<Map<String, String>> _$formDataComputed;

  @override
  Map<String, String> get formData => (_$formDataComputed ??=
          Computed<Map<String, String>>(() => super.formData,
              name: '_RegisterStoreBase.formData'))
      .value;

  final _$nameAtom = Atom(name: '_RegisterStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_RegisterStoreBase.password');

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

  final _$confirmPasswordAtom =
      Atom(name: '_RegisterStoreBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$birthdateAtom = Atom(name: '_RegisterStoreBase.birthdate');

  @override
  String get birthdate {
    _$birthdateAtom.reportRead();
    return super.birthdate;
  }

  @override
  set birthdate(String value) {
    _$birthdateAtom.reportWrite(value, super.birthdate, () {
      super.birthdate = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_RegisterStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$signUpAsyncAction = AsyncAction('_RegisterStoreBase.signUp');

  @override
  Future<String> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeConfirmPassword(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.changeConfirmPassword');
    try {
      return super.changeConfirmPassword(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBirthdate(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.changeBirthdate');
    try {
      return super.changeBirthdate(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
birthdate: ${birthdate},
isLoading: ${isLoading},
formData: ${formData}
    ''';
  }
}
