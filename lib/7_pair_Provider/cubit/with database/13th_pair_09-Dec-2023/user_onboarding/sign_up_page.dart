// import 'package:databases_flutter_class/5_pair_29-Nov-2023/app_db.dart';
// import 'package:databases_flutter_class/5_pair_29-Nov-2023/user_Model.dart';
// import 'package:databases_flutter_class/6_pair_30-Nov-2023/user_onboarding/login_page.dart';
// import 'package:flutter/material.dart';
//
// import '../app_db.dart';
// import '../model/user_Model.dart';
//
// import 'login_page.dart';
//
// class SignUpPage extends StatelessWidget {
//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sign up"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Create Account"),
//           SizedBox(height: 21),
//           TextField(
//             controller: nameController,
//           ),
//           SizedBox(height: 11),
//           TextField(
//             controller: emailController,
//           ),
//           SizedBox(height: 11),
//           TextField(
//             controller: passController,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 if (nameController.text.isNotEmpty &&
//                     emailController.text.isNotEmpty &&
//                     passController.text.isNotEmpty) {
//                   var appDb = AppDataBase.instance;
//
//                   var check = await appDb.createAccount(UserModel(
//                       user_id: 0,
//                       user_name: nameController.text.toString(),
//                       user_email: emailController.text.toString(),
//                       user_pass: passController.text.toString()));
//                   var msg = "";
//                   if (check) {
//                     msg = "Account Created Succesfully!!";
//
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => LoginPage()));
//                   } else {
//                     msg = "cannot create account as email already exists!!";
//                   }
//
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text(msg)));
//                 }
//               },
//               child: Text("Sign up")),
//           TextButton(
//               onPressed: () {
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (context) => LoginPage()));
//               },
//               child: Text("Already have an account? Login now"))
//         ],
//       ),
//     );
//   }
// }
