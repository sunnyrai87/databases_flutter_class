import 'package:databases_flutter_class/10th_pair_Expense%20App/15&16_Dec-2023/app_constants/content_constants.dart';
import 'package:databases_flutter_class/17th_pair/provider/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../date_utils.dart';
import '../exp_bloc/expense_bloc.dart';
import '../models/expense_model.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double mWidth = 0.0;
  double mHeight = 0.0;
  MediaQueryData? mq;

  List<DateWiseExpenseModel> dateWiseExpenses = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    getWidthHeight();
    var isDark =Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:isDark
          ? Colors.black
          : Colors.grey.shade400,
      appBar: AppBar(
        title: const Text("Add Expense"),
        backgroundColor: isDark? Colors.grey:Colors.blue,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 21),
              TextButton.icon(
                onPressed: () async {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (ctx) => LoginScreen()));
                  // var prefs = await SharedPreferences.getInstance();
                  // prefs.setBool(LoginScreen.LOGIN_PREFS_KEY, false);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.blue,
                ),
                label: const Text(
                  "Log out",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SwitchListTile(
                title: Text("Dark Mode"),
                  subtitle: Text("Control theme of App from here"),
                  value: context.watch<ThemeProvider>().themeValue,
                  onChanged: (value) {
                    context.read<ThemeProvider>().themeValue = value;
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErrorState) {
            return Center(child: Text(state.ErrMsg));
          } else if (state is ExpenseLoadedState) {
            if (state.mData.isNotEmpty) {
              filterDayWiseExpenses(state.mData);
              //return mWidth > mHeight
              return mq!.orientation == Orientation.landscape
                  ? LandscapeLay(dateWiseExpenses)
                  : portraitlay(dateWiseExpenses);
            } else {
              return Center(
                child: Text("no exp yet"),
              );
            }
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddExpenseScreen()));
        },
      ),
    );
  }

  void getWidthHeight() {
    mq = MediaQuery.of(context);
    mWidth = mq!.size.width;
    mHeight = mq!.size.height;
    print("Width:$mWidth, Height:$mHeight");
  }

  Widget portraitlay(List<DateWiseExpenseModel> dateWiseExpenses) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Balance Till now"),
                  Text("0.0",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: mainLay(dateWiseExpenses),
        ),
      ],
    );
  }

  Widget LandscapeLay(List<DateWiseExpenseModel> dateWiseExpenses) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your Balance Till now"),
                  Text("0.0",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: LayoutBuilder(
            builder: (_, constraints) {
              print("internal width : ${constraints.maxHeight},"
                  "internal height : ${constraints.maxHeight}, ");
              return mainLay(dateWiseExpenses,
                  isLandscape: constraints.maxWidth > 500 ? true : false);
            },
          ),
        ),
      ],
    );
  }

  Widget mainLay(List<DateWiseExpenseModel> dateWiseExpenses,
      {isLandscape = false}) {
    return ListView.builder(
        itemCount: dateWiseExpenses.length,
        itemBuilder: (_, parentindex) {
          var eachItem = dateWiseExpenses[parentindex];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${eachItem.Date}"),
                    Text("${eachItem.totalAmt}")
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                isLandscape
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 70, crossAxisSpacing: 11),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: eachItem.allTransactions.length,
                        itemBuilder: (_, childIndex) {
                          var eachTrans = eachItem.allTransactions[childIndex];
                          return GridTile(
                            child: Image.asset(
                                AppConstants
                                    .mCategory[eachTrans.expCatType].catImgPath,
                                width: 40,
                                height: 40),
                            header: Text(eachTrans.expTitle),
                            footer: Text(eachTrans.expAmt.toString()),
                          );
                        })
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: eachItem.allTransactions.length,
                        itemBuilder: (_, childindex) {
                          var eachTrans = eachItem.allTransactions[childindex];
                          return ListTile(
                            leading: Image.asset(AppConstants
                                .mCategory[eachTrans.expCatType].catImgPath),
                            title: Text('${eachTrans.expTitle}'),
                            subtitle: Text('${eachTrans.expDesc}'),
                            trailing: Column(
                              children: [
                                Text('${eachTrans.expAmt.toString()}'),

                                ///balnce will be added here
                              ],
                            ),
                          );
                        }),
              ],
            ),
          );
        });
  }

  void filterDayWiseExpenses(List<ExpenseModel> allExpenses) {
    dateWiseExpenses.clear();
    // List<DateWiseExpenseModel> filterDayWiseExpenses (
    //     List<ExpenseModel> allExpenses) {
    //   List<DateWiseExpenseModel> dateWiseExpenses =[];

    var listUniqueDates = [];
    for (ExpenseModel eachExp in allExpenses) {
      //var eachDate =
      //DateTime.fromMicrosecondsSinceEpoch(int.parse(eachExp.expTimeStamp));
      var mDate = DateTimeUtils.getFormattedDateFromMilli(
          int.parse(eachExp.expTimeStamp));
      //print(mDate);
      if (!listUniqueDates.contains(mDate)) {
        /// not contains
        listUniqueDates.add(mDate);
      }
      ;
    }
    print(listUniqueDates);
    for (String date in listUniqueDates) {
      List<ExpenseModel> eachDateExp = [];
      var totalAmt = 0.0;
      for (ExpenseModel eachExp in allExpenses) {
        var mDate = DateTimeUtils.getFormattedDateFromMilli(
            int.parse(eachExp.expTimeStamp));

        if (date == mDate) {
          eachDateExp.add(eachExp);
          if (eachExp.expType == 0) {
            ///debit
            totalAmt -= eachExp.expAmt;
          } else {
            totalAmt += eachExp.expAmt;
          }
        }
      }

      /// for today

      //var todayDate= DateTime.now();
      var formattedTodayDate =
          DateTimeUtils.getFormattedDateFromDateTime(DateTime.now());

      if (formattedTodayDate == date) {
        date = "Today";
      }

      /// for yesterday

      // var yesterdayDate= DateTime.now().subtract(Duration(days: 1));
      var formattedYesterdayDate = DateTimeUtils.getFormattedDateFromDateTime(
          DateTime.now().subtract(Duration(days: 1)));

      if (formattedYesterdayDate == date) {
        date = "Yesterday";
      }

      dateWiseExpenses.add(DateWiseExpenseModel(
          Date: date,
          totalAmt: totalAmt.toString(),
          allTransactions: eachDateExp));
    }
    //print(dateWiseExpenses[1].allTransactions.toString());
  }
}
