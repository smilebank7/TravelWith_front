class MemberInfoDTO {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String profileImg;
  final DateTime birthDate;
  final String gender; // Assuming gender is stored as a string

  MemberInfoDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profileImg,
    required this.birthDate,
    required this.gender,
  });

  factory MemberInfoDTO.fromJson(Map<String, dynamic> json) {
    return MemberInfoDTO(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      profileImg: json['profileImg'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
    );
  }
  factory MemberInfoDTO.empty() {
    return MemberInfoDTO(
      id: 0, // Default value for int
      name: '',
      email: '',
      phoneNumber: '',
      profileImg: '',
      birthDate: DateTime(1900, 1, 1), // An arbitrary default date, change as needed
      gender: '',
    );
  }
  // Add a toJson method if you need to convert MemberInfoDTO instances back to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImg': profileImg,
      'birthDate': birthDate.toIso8601String(),
      'gender': gender,
    };
  }
  @override
  String toString() {
    return 'MemberInfoDTO(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, profileImg: $profileImg, birthDate: ${birthDate.toIso8601String()}, gender: $gender)';
  }
}
