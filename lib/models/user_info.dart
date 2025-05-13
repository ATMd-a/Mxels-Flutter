class UserInfo {
  final String name;
  final String bday;
  final String phoneNumber;
  final String email;
  final String password;

  UserInfo({
    required this.name,
    required this.bday,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bday': bday,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
  }

  // Create from JSON
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['name'],
      bday: json['bday'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
    );
  }
}
