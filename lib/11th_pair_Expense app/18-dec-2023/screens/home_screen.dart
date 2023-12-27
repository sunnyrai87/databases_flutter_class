import 'package:databases_flutter_class/11th_pair_Expense%20app/18-dec-2023/screens/add_expense_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exp_bloc/expense_bloc.dart';
import '../models/expense_model.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: const Text("Add Expense"),
        backgroundColor: Colors.blue,
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
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoadingState) {
            return Center(child: CircularProgressIndicator(),);
          }

          if (state is ExpenseErrorState) {
            return Center(child: Text(state.ErrMsg));
          }
          if (state is ExpenseLoadedState) {
            print(state.mData.toString());
            filterDayWiseExpenses(state.mData);
            return ListView.builder(itemBuilder: (_, index){

              return Container();
            });
          }
          return Container()
          ;
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
  void filterDayWiseExpenses(List<ExpenseModel> allExpenses){}
}
