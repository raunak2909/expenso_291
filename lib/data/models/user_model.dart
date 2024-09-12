import 'package:expanses_task11/data/local/db_helper.dart';

class UserModel {
  int? uid;
  String name;
  String email;
  String mobNo;
  String pass;

  UserModel(
      {required this.name,
      required this.email,
      required this.mobNo,
      required this.pass,
      this.uid});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map[DBHelper.COLUMN_USER_ID],
        name: map[DBHelper.COLUMN_USER_NAME],
        email: map[DBHelper.COLUMN_USER_EMAIL],
        mobNo: map[DBHelper.COLUMN_USER_MOBNO],
        pass: map[DBHelper.COLUMN_USER_PASS]);
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.COLUMN_USER_NAME: name,
      DBHelper.COLUMN_USER_EMAIL: email,
      DBHelper.COLUMN_USER_MOBNO: mobNo,
      DBHelper.COLUMN_USER_PASS: pass,
    };
  }
}
