// import 'package:flutter/material.dart';
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
//         textTheme: TextTheme(
//             displayLarge: TextStyle(
//                 fontSize: 43,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.orange),
//             displayMedium: TextStyle(
//                 fontSize: 35, fontWeight: FontWeight.w500, color: Colors.blue),
//             titleLarge: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.deepPurple),
//             bodyLarge: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.green)),
//         useMaterial3: true,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(children: [
//             Text("Hello", style: Theme.of(context).textTheme.displayLarge),
//             Text("dev", style: Theme.of(context).textTheme.titleLarge),
//             Text("World",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(fontWeight: FontWeight.bold, color: Colors.grey)),
//             Text("Welcome to flutter",
//                 style: Theme.of(context).textTheme.bodyLarge),
//           ]),
//         ),
//       ),
//     );
//   }
// }
