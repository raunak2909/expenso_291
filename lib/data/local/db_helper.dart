import 'package:expanses_task11/data/models/expense_model.dart';
import 'package:expanses_task11/data/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  Database? mDB;

  static final String TABLE_EXPENSE_NAME = "expense";
  static final String COLUMN_EXPENSE_ID = "eid";

  ///pk
  static final String COLUMN_EXPENSE_TITLE = "eTitle";
  static final String COLUMN_EXPENSE_DESC = "eDesc";
  static final String COLUMN_EXPENSE_AMT = "eAmt";
  static final String COLUMN_EXPENSE_BAL = "eBal";
  static final String COLUMN_EXPENSE_TYPE = "eType"; /// 0 for debit, 1 for credit
  ///credit debit
  static final String COLUMN_EXPENSE_CATID = "eCatId";
  static final String COLUMN_EXPENSE_CREATED_AT = "eCreatedAt";

  static final String TABLE_USER_NAME = "user";
  static final String COLUMN_USER_ID = "uid";
  ///pk, fk
  static final String COLUMN_USER_NAME = "name";
  static final String COLUMN_USER_EMAIL = "email";
  static final String COLUMN_USER_MOBNO = "mobNo";
  static final String COLUMN_USER_PASS = "pass";

  Future<Database> getDB() async {
    mDB ??= await openDB();
    return mDB!;
  }

  Future<Database> openDB() async {
    var docPath = await getApplicationDocumentsDirectory();
    var dbPath = join(docPath.path, "expenseDB.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      /// create tables here
      db.execute(
          "create table $TABLE_USER_NAME ( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text, $COLUMN_USER_EMAIL text, $COLUMN_USER_MOBNO text, $COLUMN_USER_PASS text)");

      db.execute(
          "create table $TABLE_EXPENSE_NAME ( $COLUMN_EXPENSE_ID integer primary key autoincrement, $COLUMN_USER_ID integer, $COLUMN_EXPENSE_TITLE text, $COLUMN_EXPENSE_DESC text, $COLUMN_EXPENSE_AMT real, $COLUMN_EXPENSE_BAL real, $COLUMN_EXPENSE_CATID integer, $COLUMN_EXPENSE_CREATED_AT text, $COLUMN_EXPENSE_TYPE integer)");

    });
  }

  ///queries

  Future<bool> isUserAlreadyRegistered(String email) async{
    var db = await getDB();

    var data = await db.query(TABLE_USER_NAME, where: "$COLUMN_USER_EMAIL = ?", whereArgs: [email]);

    return data.isNotEmpty;
  }

  Future<bool> registerUser(UserModel newUser) async{
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_USER_NAME, newUser.toMap());
    return rowsEffected>0;
  }

  ///expense
  Future<bool> addNewExpense({required ExpenseModel newExpense}) async{
    var db = await getDB();

    int rowsEffected = await db.insert(TABLE_EXPENSE_NAME, newExpense.toMap());

    return rowsEffected>0;
  }

  Future<List<ExpenseModel>> getAllExpenses() async{
    var db = await getDB();

    List<Map<String, dynamic>> mData = await db.query(TABLE_EXPENSE_NAME);

    List<ExpenseModel> mExpenses= [];

    for(Map<String, dynamic> eachExp in mData){
      mExpenses.add(ExpenseModel.fromMap(eachExp));
    }


    return mExpenses;

  }


}
