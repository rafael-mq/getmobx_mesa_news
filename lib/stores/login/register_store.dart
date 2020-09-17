import 'package:get/get.dart';
import 'package:getmobx_mesa_news/models/user.dart';
import 'package:getmobx_mesa_news/services/auth_api.dart';
import 'package:getmobx_mesa_news/stores/login/login_store.dart';
import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final loginStore = Get.find<LoginStore>();
  final api = AuthApi();

  @observable
  String name;
  @action
  changeName(String value) => name = value;

  @observable
  String email;
  @action
  changeEmail(String value) => email = value;

  @observable
  String password;
  @action
  changePassword(String value) => password = value;

  @observable
  String confirmPassword;
  @action
  changeConfirmPassword(String value) => confirmPassword = value;

  @observable
  String birthdate;
  @action
  changeBirthdate(String value) => birthdate = value;

  @observable
  bool isLoading = false;
  @action
  setLoading(bool value) {
    print("loading was set to $value");
    isLoading = value;
  }

  @computed
  Map<String, String> get formData => {"name": name, "email": email, "password": password};

  @action
  Future<String> signUp() async {
    try {
      setLoading(true);
      User user = await api.register(formData);
      if (user != null) {
        loginStore.setUser(user);
      }
      return "";
    } catch (e) {
      print(e);
      setLoading(false);
      return "Falha no processo de cadastro.";
    }
  }
}
