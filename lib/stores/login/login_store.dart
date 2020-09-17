import 'package:get/get.dart';
import 'package:getmobx_mesa_news/models/user.dart';
import 'package:getmobx_mesa_news/stores/login/login_form.dart';
import 'package:getmobx_mesa_news/services/auth_api.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final loginForm = LoginForm();
  final api = AuthApi();

  _LoginStoreBase() {
    // setReactions();
  }

  @observable
  bool isLoading = false;
  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @observable
  String errorMessage = "";
  @action
  setErrorMessage(msg) {
    errorMessage = msg;
  }

  @observable
  User user;
  @action
  setUser(User newUser) {
    user = newUser;
  }

  @computed
  String get token => user?.token;

  @computed
  bool get isAuthenticated => user != null;

  @action
  doLogin() async {
    try {
      setLoading(true);
      var newUser = await api.login(loginForm.credentials);
      if (newUser != null) {
        setUser(newUser);
        await Get.offNamed('/news');
      }
    } catch (e) {
      setLoading(false);
      print(e);
      setErrorMessage("Email ou senha inválidos.");
      print("authentication failed");
    }
  }

  @action
  doLogout() {
    user = null;
  }

  // setReactions() {
  //   when((_) => isAuthenticated, () => Get.offAndToNamed('/news'));
  //   when((_) => !isAuthenticated, () => Get.offAndToNamed('/'));
  // }
}
