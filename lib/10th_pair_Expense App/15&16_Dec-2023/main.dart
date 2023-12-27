// import 'package:databases_flutter_class/10th_pair_Expense%20App/15&16_Dec-2023/screens/add_expense_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'db/app_db.dart';
// import 'exp_bloc/expense_bloc.dart';
//
//
// void main() {
//   runApp(BlocProvider(
//     create: (context) => ExpenseBloc(db: AppDataBase.instance),
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
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: AddExpenseScreen(),
//     );
//   }
// }