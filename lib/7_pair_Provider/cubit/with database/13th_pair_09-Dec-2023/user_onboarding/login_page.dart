// import 'package:databases_flutter_class/6_pair_30-Nov-2023/app_db.dart';
// import 'package:databases_flutter_class/6_pair_30-Nov-2023/main.dart';
// import 'package:databases_flutter_class/6_pair_30-Nov-2023/user_onboarding/sign_up_page.dart';
// import 'package:databases_flutter_class/7_pair_Provider/cubit/with%20database/13th_pair_09-Dec-2023/user_onboarding/sign_up_page.dart';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../app_db.dart';
// import '../main.dart';
//
// class LoginPage extends StatelessWidget {
//   var emailController = TextEditingController();
//   var passController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Hi, welcome back", style: TextStyle(fontSize: 34)),
//           SizedBox(height: 21),
//           TextField(
//             controller: emailController,
//           ),
//           SizedBox(height: 11),
//           TextField(
//             controller: passController,
//           ),
//           SizedBox(height: 21),
//           ElevatedButton(
//               onPressed: () async {
//                 if (emailController.text.isNotEmpty &&
//                     passController.text.isNotEmpty) ;
//                 var email = emailController.text.toString();
//                 var pass = passController.text.toString();
//                 var appDB = AppDataBase.instance;
//
//                 if (await appDB.authenticateUser(email, pass)) {
//
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Invalid Email and Password")));
//                 }
//               },
//               child: Text("Login")),
//           TextButton(onPressed: (){
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
//           }, child: Text("New User? Create Account"))
//         ],
//       ),
//     );
//   }
// }
