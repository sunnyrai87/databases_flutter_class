import 'package:databases_flutter_class/10th_pair_Expense%20App/15&16_Dec-2023/app_constants/content_constants.dart';
import 'package:databases_flutter_class/11th_pair_Expense%20app/18-dec-2023/exp_bloc/expense_bloc.dart';
import 'package:databases_flutter_class/11th_pair_Expense%20app/18-dec-2023/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../app_constants/CstmButton.dart';
import '../app_widgets/exp_text_field.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpenseScreen> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amtController = TextEditingController();
  var transactiontype = ["Debit", "Credit"];
  var selectedTransactionType = "Debit";
  DateTime selectedDate = DateTime.now(); /// for default date
  var selectedCatIndex = -1;
  DateTime expenseDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 2, 15),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null)  {
      setState(() {
        expenseDate = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Expense"),
          backgroundColor: Colors.blue,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 21),
          ExpenseTextField(
            label: "Name your expense",
            controller: titleController,
            iconData: Icons.abc,
          ),
          ExpenseTextField(
            label: "Add Description",
            controller: descController,
            iconData: Icons.abc,
          ),
          ExpenseTextField(
            label: "Enter amount",
            controller: amtController,
            iconData: Icons.money_sharp,
            keyboardType: TextInputType.number,
          ),
          Container(
              height: 35,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton(
                value: selectedTransactionType,
                items: transactiontype
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  selectedTransactionType = value!;
                  setState(() {});
                },
              )),
          CstmButton(
            name: "Choose Expense",
            mWidget: selectedCatIndex != -1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppConstants.mCategory[selectedCatIndex].catImgPath,
                        width: 25,
                        height: 25,
                      ),
                      Text(
                        "_ ${AppConstants.mCategory[selectedCatIndex].catTitle}",

                      )
                    ],
                  )
                : null,
            btnColor: Colors.white,
            textColor: Colors.black,
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                context: context,
                builder: (context) {
                  return GridView.builder(
                    itemCount: AppConstants.mCategory.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      var eachCat = AppConstants.mCategory[index];
                      return InkWell(
                        onTap: () {
                          selectedCatIndex = index;
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(11),
                            child: Image.asset(eachCat.catImgPath),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          SizedBox(height: 11),
          CstmButton(
            name: DateFormat.yMMMMd().format(expenseDate),
            btnColor: Colors.white,
            textColor: Colors.purple,
            onTap: () {
              _selectDate(context);
            },
          ),
        SizedBox(height: 11),
        CstmButton(
            name: "ADD Expense",
            btnColor: Colors.black,
            textColor: Colors.white, onTap: () {
          print(amtController.text.toString());
              var newExpense= ExpenseModel(
                  expID: 0,
                  uId: 0,
                  expTitle: titleController.text.toString(),
                  expDesc: descController.text.toString(),
                  expTimeStamp: expenseDate.microsecondsSinceEpoch.toString(),
                  expAmt: int.parse(amtController.text.toString()),
                  expBal: 0,
                  expType: selectedTransactionType=="Debit" ? 0: 1,
                  expCatType: selectedCatIndex);
              BlocProvider.of<ExpenseBloc>(context).add(AddExpenseEvent(newExpense:newExpense ));
              Navigator.pop(context);
        }),
        ]));
  }
}
