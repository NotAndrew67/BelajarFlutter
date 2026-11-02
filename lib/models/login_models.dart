class LoginModels {
  bool status;
  String message;
  String token;

  LoginModels({
    required this.status,
    required this.message,
    required this.token,
  });

  factory LoginModels.fromJson(Map<String, dynamic> json) {
    return LoginModels(
      status: json['status'],
      message: json['message'],
      token: json['token'] ?? '',
    );
  }
}