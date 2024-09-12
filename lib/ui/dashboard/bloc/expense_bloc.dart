import 'package:expanses_task11/ui/dashboard/bloc/expense_event.dart';
import 'package:expanses_task11/ui/dashboard/bloc/expense_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/db_helper.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  DBHelper dbHelper;

  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()) {
    ///events
    on<AddNewExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      bool check = await dbHelper.addNewExpense(newExpense: event.newExpense);

      if (check) {
        var data = await dbHelper.getAllExpenses();
        emit(ExpenseLoadedState(mData: data));
      } else {
        emit(ExpenseErrorState(errorMsg: "Expense not added!!"));
      }
    });

    on<GetInitialExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());
      var data = await dbHelper.getAllExpenses();
      emit(ExpenseLoadedState(mData: data));
    });

    /*on<GetFinalExpenseBalanceEvent>((event, emit) async {
      emit(ExpenseLoadingState());
      var data = await dbHelper.getAllExpenses();
      emit(ExpenseBalanceLoadedState(
          bal: data.isNotEmpty ? data.last.bal : 0.0));
      emit(ExpenseLoadedState(mData: data));
    });*/
  }
}
