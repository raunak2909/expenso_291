import 'package:expanses_task11/data/local/db_helper.dart';

class ExpenseModel {
  int? eid;
  int cat_id;
  int uid;
  int eType; //0 and 1
  String eTitle;
  String eDesc;
  num amt;
  num bal;
  String created_at;

  ExpenseModel({this.eid,
    required this.cat_id,
    required this.uid,
    required this.eType,
    required this.eTitle,
    required this.eDesc,
    required this.amt,
    required this.bal,
    required this.created_at});


  factory ExpenseModel.fromMap(Map<String, dynamic> map){
    return ExpenseModel(
        eid: map[DBHelper.COLUMN_EXPENSE_ID],
        cat_id: map[DBHelper.COLUMN_EXPENSE_CATID],
        uid: map[DBHelper.COLUMN_USER_ID],
        eType: map[DBHelper.COLUMN_EXPENSE_TYPE],
        eTitle: map[DBHelper.COLUMN_EXPENSE_TITLE],
        eDesc: map[DBHelper.COLUMN_EXPENSE_DESC],
        amt: map[DBHelper.COLUMN_EXPENSE_AMT],
        bal: map[DBHelper.COLUMN_EXPENSE_BAL],
        created_at: map[DBHelper.COLUMN_EXPENSE_CREATED_AT]);
  }

  Map<String, dynamic> toMap(){
    return {
      DBHelper.COLUMN_EXPENSE_CATID : cat_id,
      DBHelper.COLUMN_EXPENSE_TITLE : eTitle,
      DBHelper.COLUMN_EXPENSE_DESC : eDesc,
      DBHelper.COLUMN_EXPENSE_TYPE : eType,
      DBHelper.COLUMN_EXPENSE_AMT : amt,
      DBHelper.COLUMN_EXPENSE_BAL : bal,
      DBHelper.COLUMN_USER_ID : uid,
      DBHelper.COLUMN_EXPENSE_CREATED_AT : created_at,
    };
  }
}
