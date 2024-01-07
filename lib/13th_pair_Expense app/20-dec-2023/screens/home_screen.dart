// import 'package:databases_flutter_class/10th_pair_Expense%20App/15&16_Dec-2023/app_constants/content_constants.dart';
// import 'package:databases_flutter_class/11th_pair_Expense%20app/18-dec-2023/screens/add_expense_screen.dart';
// import 'package:databases_flutter_class/13th_pair_Expense%20app/20-dec-2023/date_utils.dart';
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
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var mq = MediaQuery.of(context);
//     var mWidth = mq.size.width;
//     var mHeight = mq.size.height;
//     print("Width:$mWidth, Height:$mHeight");
//
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
//             if (state.mData.isNotEmpty) {
//               filterDayWiseExpenses(state.mData);
//               //return mWidth > mHeight
//               return mq.orientation == Orientation.landscape
//                   ? LandscapeLay(dateWiseExpenses)
//                   : portraitlay(dateWiseExpenses);
//             } else {
//               return Center(
//                 child: Text("no exp yet"),
//               );
//             }
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
//   Widget portraitlay(List<DateWiseExpenseModel> dateWiseExpenses) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 3,
//           child: Container(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Your Balance Till now"),
//                   Text("0.0",
//                       style:
//                           TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: ListView.builder(
//               itemCount: dateWiseExpenses.length,
//               itemBuilder: (_, parentindex) {
//                 var eachItem = dateWiseExpenses[parentindex];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("${eachItem.Date}"),
//                           Text("${eachItem.totalAmt}")
//                         ],
//                       ),
//                       Divider(
//                         color: Colors.black,
//                       ),
//                       ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: eachItem.allTransactions.length,
//                           itemBuilder: (_, childindex) {
//                             var eachTrans =
//                                 eachItem.allTransactions[childindex];
//                             return ListTile(
//                               leading: Image.asset(AppConstants
//                                   .mCategory[eachTrans.expCatType].catImgPath),
//                               title: Text('${eachTrans.expTitle}'),
//                               subtitle: Text('${eachTrans.expDesc}'),
//                               trailing: Column(
//                                 children: [
//                                   Text('${eachTrans.expAmt.toString()}'),
//
//                                   ///balnce will be added here
//                                 ],
//                               ),
//                             );
//                           }),
//                     ],
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
//
//   Widget LandscapeLay(List<DateWiseExpenseModel> dateWiseExpenses) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 1,
//           child: Container(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Your Balance Till now"),
//                   Text("0.0",
//                       style:
//                           TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: ListView.builder(
//               itemCount: dateWiseExpenses.length,
//               itemBuilder: (_, parentindex) {
//                 var eachItem = dateWiseExpenses[parentindex];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("${eachItem.Date}"),
//                           Text("${eachItem.totalAmt}")
//                         ],
//                       ),
//                       Divider(
//                         color: Colors.black,
//                       ),
//                       ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: eachItem.allTransactions.length,
//                           itemBuilder: (_, childindex) {
//                             var eachTrans =
//                                 eachItem.allTransactions[childindex];
//                             return ListTile(
//                               leading: Image.asset(AppConstants
//                                   .mCategory[eachTrans.expCatType].catImgPath),
//                               title: Text('${eachTrans.expTitle}'),
//                               subtitle: Text('${eachTrans.expDesc}'),
//                               trailing: Column(
//                                 children: [
//                                   Text('${eachTrans.expAmt.toString()}'),
//
//                                   ///balnce will be added here
//                                 ],
//                               ),
//                             );
//                           }),
//                     ],
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
//
//   void filterDayWiseExpenses(List<ExpenseModel> allExpenses) {
//     dateWiseExpenses.clear();
//     // List<DateWiseExpenseModel> filterDayWiseExpenses (
//     //     List<ExpenseModel> allExpenses) {
//     //   List<DateWiseExpenseModel> dateWiseExpenses =[];
//
//     var listUniqueDates = [];
//     for (ExpenseModel eachExp in allExpenses) {
//       //var eachDate =
//       //DateTime.fromMicrosecondsSinceEpoch(int.parse(eachExp.expTimeStamp));
//       var mDate = DateTimeUtils.getFormattedDateFromMilli(
//           int.parse(eachExp.expTimeStamp));
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
//         var mDate = DateTimeUtils.getFormattedDateFromMilli(
//             int.parse(eachExp.expTimeStamp));
//
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
//
//       /// for today
//
//       //var todayDate= DateTime.now();
//       var formattedTodayDate =
//           DateTimeUtils.getFormattedDateFromDateTime(DateTime.now());
//
//       if (formattedTodayDate == date) {
//         date = "Today";
//       }
//
//       /// for yesterday
//
//       // var yesterdayDate= DateTime.now().subtract(Duration(days: 1));
//       var formattedYesterdayDate = DateTimeUtils.getFormattedDateFromDateTime(
//           DateTime.now().subtract(Duration(days: 1)));
//
//       if (formattedYesterdayDate == date) {
//         date = "Yesterday";
//       }
//
//       dateWiseExpenses.add(DateWiseExpenseModel(
//           Date: date,
//           totalAmt: totalAmt.toString(),
//           allTransactions: eachDateExp));
//     }
//     //print(dateWiseExpenses[1].allTransactions.toString());
//   }
// }
