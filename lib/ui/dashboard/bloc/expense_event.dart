import 'package:expanses_task11/data/models/expense_model.dart';

abstract class ExpenseEvent{}

class AddNewExpenseEvent extends ExpenseEvent{
  ExpenseModel newExpense;
  AddNewExpenseEvent({required this.newExpense});
}

class GetInitialExpenseEvent extends ExpenseEvent{}
/*
class GetFinalExpenseBalanceEvent extends ExpenseEvent{}*/
