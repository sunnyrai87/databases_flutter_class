// import 'package:databases_flutter_class/5_pair_29-Nov-2023/app_db.dart';
//
// class UserModel {
//   int user_id;
//   String user_name;
//   String user_email;
//   String user_pass;
//
//   UserModel(
//       {required this.user_id,
//       required this.user_name,
//       required this.user_email,
//       required this.user_pass});
//
//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//         user_id: map[AppDataBase.COLUMN_USER_ID],
//         user_name: map[AppDataBase.COLUMN_USER_NAME],
//         user_email: map[AppDataBase.COLUMN_USER_EMAIL],
//         user_pass: map[AppDataBase.COLUMN_USER_PASS]);
//   }
//   Map<String, dynamic> toMAP() {
//     return {
//       //AppDataBase.COLUMN_USER_ID: user_id,
//       AppDataBase.COLUMN_USER_NAME: user_name,
//       AppDataBase.COLUMN_USER_EMAIL: user_email,
//       AppDataBase.COLUMN_USER_PASS: user_pass,
//     };
//   }
// }
