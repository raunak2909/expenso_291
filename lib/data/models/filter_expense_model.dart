import 'expense_model.dart';

class FilterExpenseModel{
  num totalAmt;
  String title;
  List<ExpenseModel> mExpenses;

  FilterExpenseModel({required this.totalAmt, required this.title, required this.mExpenses});

}