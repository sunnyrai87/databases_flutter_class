part of 'expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitialState extends ExpenseState {}

class ExpenseLoadingState extends ExpenseState {}
class ExpenseLoadedState extends ExpenseState {
  List<ExpenseModel> mData;
  ExpenseLoadedState({required this.mData});
}
class ExpenseErrorState extends ExpenseState {
  String ErrMsg;
  ExpenseErrorState({required this.ErrMsg});
}

