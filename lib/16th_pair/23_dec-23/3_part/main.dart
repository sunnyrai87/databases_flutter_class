//
// import 'package:databases_flutter_class/16th_pair/23_dec-23/3_part/second_page.dart';
// import 'package:databases_flutter_class/16th_pair/23_dec-23/3_part/theme_provider.dart';
// import 'package:databases_flutter_class/16th_pair/23_dec-23/3_part/ui_helper1.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
//
//
// void main() {
//   runApp(ChangeNotifierProvider(create:
//       (context) => ThemeProvider(),
//     child: const MyApp(),
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     var isDark =context.watch<ThemeProvider>().themeValue;
//     return MaterialApp(
//       title: 'Flutter Demo',
//       //themeMode: ThemeMode.light,
//       themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
//       darkTheme: ThemeData.dark(),
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   bool isDark = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(children: [
//             Text("Hello", style: mTextStyleOpensansitalic()),
//             Text("dev", style: mTextStyleOpensans25(fontWeight: FontWeight.bold, fontColor: Colors.blue)),
//             Text("World", style: mTextStyleOpensans43()),
//             Text("Welcome to flutter",
//                 style: Theme.of(context).textTheme.bodyLarge),
//
//
//           ]),
//         ),
//       ),
//    floatingActionButton: FloatingActionButton(onPressed: (){
//      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
//    },
//      child: Icon(Icons.settings),),
//
//     );
//   }
// }
