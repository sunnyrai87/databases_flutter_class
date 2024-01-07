// import 'package:databases_flutter_class/10th_pair_Expense%20App/15&16_Dec-2023/app_constants/content_constants.dart';
// import 'package:databases_flutter_class/11th_pair_Expense%20app/18-dec-2023/screens/add_expense_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../exp_bloc/expense_bloc.dart';
// import '../models/expense_model.dart';
// import 'add_expense_screen.dart';
// import 'login_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<DateWiseExpenseModel> dateWiseExpenses = [];
//   var dateFormat = DateFormat.yMd();
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade400,
//       appBar: AppBar(
//         title: const Text("Add Expense"),
//         backgroundColor: Colors.blue,
//       ),
//       drawer: Drawer(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 21),
//               TextButton.icon(
//                 onPressed: () async {
//                   // Navigator.pushReplacement(context,
//                   //     MaterialPageRoute(builder: (ctx) => LoginScreen()));
//                   // var prefs = await SharedPreferences.getInstance();
//                   // prefs.setBool(LoginScreen.LOGIN_PREFS_KEY, false);
//                 },
//                 icon: const Icon(
//                   Icons.logout,
//                   color: Colors.blue,
//                 ),
//                 label: const Text(
//                   "Log out",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       body: BlocBuilder<ExpenseBloc, ExpenseState>(
//         builder: (context, state) {
//           if (state is ExpenseLoadingState) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is ExpenseErrorState) {
//             return Center(child: Text(state.ErrMsg));
//           } else if (state is ExpenseLoadedState) {
//             if(state.mData.isNotEmpty){
//               filterDayWiseExpenses(state.mData);
//               return ListView.builder(
//                   itemCount: dateWiseExpenses.length,
//                   itemBuilder: (_, parentindex) {
//                     var eachItem = dateWiseExpenses[parentindex];
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("${eachItem.Date}"),
//                               Text("${eachItem.totalAmt}")
//                             ],
//                           ),
//                           Divider(
//                             color: Colors.black,
//                           ),
//                           ListView.builder(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemCount: eachItem.allTransactions.length,
//                               itemBuilder: (_, childindex) {
//                                 var eachTrans =
//                                 eachItem.allTransactions[childindex];
//                                 return ListTile(
//                                   leading: Image.asset(AppConstants
//                                       .mCategory[eachTrans.expCatType]
//                                       .catImgPath),
//                                   title: Text('${eachTrans.expTitle}'),
//                                   subtitle: Text('${eachTrans.expDesc}'),
//                                   trailing: Column(
//                                     children: [
//                                       Text('${eachTrans.expAmt.toString()}'),
//
//                                       ///balnce will be added here
//                                     ],
//                                   ),
//                                 );
//                               }),
//                         ],
//                       ),
//                     );
//                   });
//             }
//             else {return Center(child: Text("no exp yet"),);}
//           }
//           return Container();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => AddExpenseScreen()));
//         },
//       ),
//     );
//   }
//
//   void filterDayWiseExpenses(List<ExpenseModel> allExpenses) {
//     dateWiseExpenses.clear();
//     var listUniqueDates = [];
//     for (ExpenseModel eachExp in allExpenses) {
//       var eachDate =
//           DateTime.fromMicrosecondsSinceEpoch(int.parse(eachExp.expTimeStamp));
//       var mDate = dateFormat.format(eachDate);
//       //print(mDate);
//       if (!listUniqueDates.contains(mDate)) {
//         /// not contains
//         listUniqueDates.add(mDate);
//       }
//       ;
//     }
//     print(listUniqueDates);
//     for (String date in listUniqueDates) {
//       List<ExpenseModel> eachDateExp = [];
//       var totalAmt = 0.0;
//       for (ExpenseModel eachExp in allExpenses) {
//         var eachDate = DateTime.fromMicrosecondsSinceEpoch(
//             int.parse(eachExp.expTimeStamp));
//         var mDate = dateFormat.format(eachDate);
//         if (date == mDate) {
//           eachDateExp.add(eachExp);
//           if (eachExp.expType == 0) {
//             ///debit
//             totalAmt -= eachExp.expAmt;
//           } else {
//             totalAmt += eachExp.expAmt;
//           }
//         }
//       }
//       dateWiseExpenses.add(DateWiseExpenseModel(
//           Date: date,
//           totalAmt: totalAmt.toString(),
//           allTransactions: eachDateExp));
//     }
//     //print(dateWiseExpenses[1].allTransactions.toString());
//   }
// }
