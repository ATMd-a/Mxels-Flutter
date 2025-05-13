import 'package:Mxels/models/user_info.dart';

import '../models/user_info.dart';

class SampleUserData {
  static final List<UserInfo> users = [
    UserInfo(
      name: 'Roselle Jean De Leon',
      bday: 'February 11, 2004',
      phoneNumber: '09171234567',
      email: 'roselle@example.com',
      password: 'abc123'
    ),
    UserInfo(
      name: 'Juan Dela Cruz',
      bday: 'September 12, 1990',
      phoneNumber: '09981234567',
      email: 'juancruz@example.com',
      password: 'qwe123'
    ),
  ];
}