// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'counter_provider.dart';
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
//       home: ChangeNotifierProvider(
//         create: (context) => CounterProvider(),
//         child: HomePage(),
//       ),
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
//       appBar: AppBar(title: Text("Provider")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('You have pushed the button this many times:'),
//             Text(//'${Provider.of<CounterProvider>(context).getCountValue()}'
//               '${context.watch<CounterProvider>().getCountValue()}'
//               ),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               //Provider.of<CounterProvider>(context, listen: false).incrementCounter();
//               context.read<CounterProvider>().incrementCounter();
//             },
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               //Provider.of<CounterProvider>(context, listen: false).incrementCounter();
//               context.read<CounterProvider>().decrementCounter();
//             },
//             tooltip: 'decrement',
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
