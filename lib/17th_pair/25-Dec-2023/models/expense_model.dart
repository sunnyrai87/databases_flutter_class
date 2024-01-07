
import '../db/app_db.dart';

class DateWiseExpenseModel{
  String Date;
  String totalAmt;
  List<ExpenseModel> allTransactions;

  DateWiseExpenseModel(
      {required this.Date,
        required this.totalAmt,
        required this.allTransactions});
}

class ExpenseModel {
  int expID;
  int uId;
  String expTitle;
  String expDesc;
  String expTimeStamp;
  num expAmt;
  num expBal;
  int expType;
  int expCatType;

  ExpenseModel(
      {required this.expID,
      required this.uId,
      required this.expTitle,
      required this.expDesc,
      required this.expTimeStamp,
      required this.expAmt,
      required this.expBal,
      required this.expType,
      required this.expCatType});

  factory ExpenseModel.fromMap(Map<String, dynamic>map){
    return ExpenseModel (
        expID: map[AppDataBase.COLUMN_EXPENSE_ID],
        uId: map[AppDataBase.COLUMN_USER_ID],
        expTitle: map[AppDataBase.COLUMN_EXPENSE_TITLE],
        expDesc: map[AppDataBase.COLUMN_EXPENSE_DESC],
        expTimeStamp: map[AppDataBase.COLUMN_EXPENSE_TIMESTAMP],
        expAmt: map[AppDataBase.COLUMN_EXPENSE_AMT],
        expBal: map[AppDataBase.COLUMN_EXPENSE_BALANCE],
        expType: map[AppDataBase.COLUMN_EXPENSE_TYPE],
        expCatType: map[AppDataBase.COLUMN_EXPENSE_CAT_TYPE]);
  }

  Map<String, dynamic> toMap(){
    return {
      AppDataBase.COLUMN_USER_ID :uId,
      AppDataBase.COLUMN_EXPENSE_TITLE :expTitle,
      AppDataBase.COLUMN_EXPENSE_DESC :expDesc,
      AppDataBase.COLUMN_EXPENSE_TIMESTAMP :expTimeStamp,
      AppDataBase.COLUMN_EXPENSE_AMT :expAmt,
      AppDataBase.COLUMN_EXPENSE_BALANCE :expBal,
      AppDataBase.COLUMN_EXPENSE_TYPE :expType,
      AppDataBase.COLUMN_EXPENSE_CAT_TYPE :expCatType,
    };
  }

}
