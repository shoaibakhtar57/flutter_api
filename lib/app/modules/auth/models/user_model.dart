class UserModel {
  String email;
  String password;

  UserModel({
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
