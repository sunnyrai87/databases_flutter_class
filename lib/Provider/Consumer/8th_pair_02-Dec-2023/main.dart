// import 'package:databases_flutter_class/Provider/Consumer/8th_pair_02-Dec-2023/second_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'counter_provider.dart';
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => CounterProvider(),
//       child: MyApp(),
//     ),
//   );
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
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     print("build called!!");
//     return Scaffold(
//       appBar: AppBar(title: Text("Provider")),
//       body: Consumer<CounterProvider>(builder: (ctx, provider, child) {
//         var listData = provider.mData;
//         return ListView.builder(
//             itemCount: listData.length,
//             itemBuilder: (_, index) {
//               return ListTile(
//                 title: Text("${listData[index]['title']}"),
//                 subtitle: Text("${listData[index]['desc']}"),
//               );
//             });
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => SecondPage()));
//         },
//         child: Icon(Icons.navigate_next_sharp),
//       ),
//     );
//   }
// }
//
// // Center(
// // child: Column(
// // mainAxisAlignment: MainAxisAlignment.center,
// // children: [
// // Text('You have pushed the button this many times:'),
// // Consumer<CounterProvider>(
// // builder: (ctx, provider, child) {
// // print("consumer build");
// // return Text(
// // //'${Provider.of<CounterProvider>(context).getCountValue()}'
// // //'${context.watch<CounterProvider>().getCountValue()}');
// // //"${provider.getCountValue()}");
// // "${provider.countValue}");
// // },
// // )
// // ],
// // ),
// // ),
