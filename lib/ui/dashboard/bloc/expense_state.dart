import '../../../data/models/expense_model.dart';

abstract class ExpenseState{}

class ExpenseInitialState extends ExpenseState{}
class ExpenseLoadingState extends ExpenseState{}
class ExpenseLoadedState extends ExpenseState{
  List<ExpenseModel> mData;
  ExpenseLoadedState({required this.mData});
}
/*class ExpenseBalanceLoadedState extends ExpenseState{
  num bal;
  ExpenseBalanceLoadedState({required this.bal});
}*/
class ExpenseErrorState extends ExpenseState{
  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}