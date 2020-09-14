class User {
  String email;
  String password;
  String token;

  User({this.email, this.password, this.token});

  factory User.fromJson(Map<String, dynamic> data) => User(
        email: data['email'],
        password: data['password'],
        token: data['token'],
      );
}
