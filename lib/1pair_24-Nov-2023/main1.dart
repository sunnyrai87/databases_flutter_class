//
// import 'package:flutter/material.dart';
//
// import 'app_db1.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Notes"),
//         ),
//         body: Container(),
//         floatingActionButton:
//         FloatingActionButton(onPressed: () {
//           var appDB = AppDataBase.instance;
//           appDB.addNote("New Note", "Implement DB in flutter app");
//
//         }, child: Icon(Icons.add)));
//   }
// }
