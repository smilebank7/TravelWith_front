class LoginDTO {
  String email;
  String password;

  LoginDTO({
    required this.email,
    required this.password,

  });

  // JSON 데이터를 User 객체로 변환
  factory LoginDTO.fromJson(Map<String, dynamic> json) {
    return LoginDTO(
      email: json['email'],
      password: json['password'],
    );
  }

  // User 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'LoginDTO{email: $email, password: $password}';
  }
}