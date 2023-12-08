import 'package:databases_flutter_class/6_pair_30-Nov-2023/app_db.dart';
import 'package:databases_flutter_class/6_pair_30-Nov-2023/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hi, welcome back", style: TextStyle(fontSize: 34)),
          SizedBox(height: 21),
          TextField(
            controller: emailController,
          ),
          SizedBox(height: 11),
          TextField(
            controller: passController,
          ),
          SizedBox(height: 21),

          ElevatedButton(onPressed: () async{
            if (emailController.text.isNotEmpty && passController.text.isNotEmpty);
            var email = emailController.text.toString();
            var pass = passController.text.toString();
            var appDB = AppDataBase.instance;

            if (await appDB.authenticateUser(email, pass)){
              Navigator.pushReplacementNamed(context, MaterialPageRoute(builder:(context) => HomePage()))
            }
          }, child: Text("Login"))
        ],
      ),
    );
  }
}
