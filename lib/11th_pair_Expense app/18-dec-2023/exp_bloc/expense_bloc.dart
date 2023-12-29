// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:databases_flutter_class/9th_pair_Bloc_withdatabase/12-Dec-2023/listmap_bloc/part_2/cubit/note_state.dart';
// import 'package:meta/meta.dart';
//
// import '../db/app_db.dart';
// import '../models/expense_model.dart';
//
// part 'expense_event.dart';
// part 'expense_state.dart';
//
// class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
//   AppDataBase db;
//
//   ExpenseBloc({required this.db}) : super(ExpenseInitialState()) {
//     on<AddExpenseEvent>((event, emit) async {
//       emit(ExpenseLoadingState());
//       var check = await db.addExpense(event.newExpense);
//       if(check){
//         var mExp= await db.fetchAllExpense();
//       emit(ExpenseLoadedState(mData: mExp));
//       }else {
//         emit(ExpenseErrorState( ErrMsg: 'Expense not added!!'));
//       }
//     });
//     on<FetchAllExpenseEvent>((event, emit) async{
//       emit(ExpenseLoadingState());
//     var mExp= await db.fetchAllExpense();
//     emit(ExpenseLoadedState(mData: mExp));
//     });
//         }
// }
