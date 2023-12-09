class SignupDTO {
  String email;
  String password;
  String name;
  String phoneNumber;
  String profileImg;
  DateTime birthDate;
  String gender;

  SignupDTO({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    required this.profileImg,
    required this.birthDate,
    required this.gender,
  });

  // JSON 데이터를 User 객체로 변환
  factory SignupDTO.fromJson(Map<String, dynamic> json) {
    return SignupDTO(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      profileImg: json['profileImg'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
    );
  }

  // User 객체를 JSON 데이터로 변환
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phoneNumber': phoneNumber,
      'profileImg': profileImg,
      'birthDate': birthDate.toIso8601String(),
      'gender': gender,
    };
  }

  @override
  String toString() {
    return 'SignupDTO{email: $email, password: $password, name: $name, phoneNumber: $phoneNumber, profileImg: $profileImg, birthDate: $birthDate, gender: $gender}';
  }
}