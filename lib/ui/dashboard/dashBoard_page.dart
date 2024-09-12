import 'dart:math';

import 'package:expanses_task11/data/models/expense_model.dart';
import 'package:expanses_task11/domain/app_constants.dart';
import 'package:expanses_task11/domain/app_utils.dart';
import 'package:expanses_task11/ui/add_expense/add_expense_page.dart';
import 'package:expanses_task11/ui/dashboard/bloc/expense_bloc.dart';
import 'package:expanses_task11/ui/dashboard/bloc/expense_event.dart';
import 'package:expanses_task11/ui/dashboard/bloc/expense_state.dart';
import 'package:expanses_task11/widgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../color_constant.dart';
import '../../data/models/filter_expense_model.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  SharedPreferences? prefs;

  String? fname;
  String? lname;

  List<FilterExpenseModel> allData = [];
  num balance = 0.0;

  DateFormat mFormat = DateFormat.yMMMd();
  DateFormat monthFormat = DateFormat.yMMMM();
  DateFormat yearFormat = DateFormat.y();

  @override
  void initState() {
    findProfileName();
    super.initState();
    context.read<ExpenseBloc>().add(GetInitialExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {

    bool isLight = Theme.of(context).brightness==Brightness.light;

    return Scaffold(
      backgroundColor: isLight ? Colors.white : Colors.black,
      appBar: getMyAppBar(context),
      drawer: Drawer(),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (_, state) {

          if (state is ExpenseLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExpenseErrorState) {
            return Center(
              child: Text("Error: ${state.errorMsg}"),
            );
          } else if (state is ExpenseLoadedState) {
            if(state.mData.isNotEmpty){

              balance = state.mData.last.bal;
              var allExpenses = state.mData.reversed.toList();

              ///filter data date wise
              filterExpenseDateWise(allExpenses);

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*-------------------Profile------------------*/
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListTile(
                      title: Text(
                        "Morning",
                        style: mTextStyle15(fontColor: Colors.grey),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/contact_avatar.png"),
                      ),
                      subtitle: Text(
                        "${fname} ${lname}",
                        style: mTextStyle11(fontColor: isLight ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing: Container(
                        height: 25,
                        width: 90,
                        child: Stack(
                          children: [
                            Container(
                              height: 25,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: isLight ? ColorConstant.colors[6] : Colors.grey,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            Positioned(
                              left: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "This Month",
                                    style: mTextStyle11(fontWeight: FontWeight.bold, fontColor: isLight ? Colors.black : Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color:  isLight ? Colors.black : Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  /*-------------------Expense Total------------------*/
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isLight ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Expense total",
                                    style: mTextStyle15(fontColor: isLight ? Colors.white : Colors.black),
                                  ),
                                  Text(
                                    "\$ $balance",
                                    //style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold),
                                    style: mTextStyle30(fontColor: isLight ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: ColorConstant.colors[4],
                                                borderRadius: BorderRadius.circular(3)),
                                          ),
                                          Positioned(
                                              top: 2,
                                              left: 4,
                                              child: Center(
                                                  child: Text(
                                                    "+\$340",
                                                    style: mTextStyle11(fontColor: isLight ? Colors.white : Colors.black),)))
                                        ],
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "then last month",
                                        style: mTextStyle11(isLight: !isLight),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              "assets/images/Box_image.png",
                              fit: BoxFit.contain,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  /*-------------------Expense List Name------------------*/
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Expense List",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: allData.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 1, color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(allData[index].title,
                                              //style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)),
                                              style: mTextStyle18()),
                                          Text("\$${allData[index].totalAmt}",
                                              style: mTextStyle18()),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: Container(
                                        height: 2,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.grey.shade400,
                                                    width: 1))),
                                      ),
                                    ),

                                    ///sublist of each date expenses
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: allData[index].mExpenses.length,
                                        itemBuilder: (_, childIndex) {
                                          List<Map<String, dynamic>> filteredList =
                                          AppConstants.mCat
                                              .where((element) =>
                                          element['id'] ==
                                              allData[index]
                                                  .mExpenses[childIndex]
                                                  .cat_id)
                                              .toList();

                                          String imgPath = filteredList[0]['imgPath'];

                                          return Padding(
                                            padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                            child: ListTile(
                                              leading: Stack(
                                                children: [
                                                  Container(
                                                    height: 45,
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                      color: ColorConstant.colors[
                                                      Random().nextInt(
                                                          ColorConstant.colors
                                                              .length -
                                                              1)]
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 7,
                                                      left: 7,
                                                      child: Image.asset(
                                                        imgPath,
                                                        width: 30,
                                                        height: 30,
                                                      ))
                                                ],
                                              ),
                                              title: Text(
                                                allData[index]
                                                    .mExpenses[childIndex]
                                                    .eTitle,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                allData[index]
                                                    .mExpenses[childIndex]
                                                    .eDesc,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              contentPadding:
                                              EdgeInsets.symmetric(horizontal: 15),
                                              trailing: Text(
                                                "\$${allData[index].mExpenses[childIndex].amt}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: allData[index]
                                                        .mExpenses[childIndex]
                                                        .eType ==
                                                        0
                                                        ? ColorConstant.colors[0]
                                                        : ColorConstant.colors[5],
                                                    fontSize: 17),
                                              ),
                                            ),
                                          );
                                        })
                                  ],
                                ),
                              ),
                            );
                          })),
                  /*listener: (_, state){
                    if(state is ExpenseLoadedState){
                      balance = state.mData.isNotEmpty ? state.mData.last.bal : 0.0;
                      setState(() {

                      });
                    }*/
                  //}, builder: (_, state) {

                  //}),
                  //),
                ],
              );

            } else {
              return Center(
                child: Text('No Expense yet!!'),
              );
            }
          }

          return Container();
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddExpensePage(balanceTillNow: balance),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void findProfileName() async {
    prefs = await SharedPreferences.getInstance();
    fname = prefs!.getString('fname');
    lname = prefs!.getString('lname');
    setState(() {});
  }

  void filterExpenseDateWise(List<ExpenseModel> allExpenses) {
    allData.clear();

    ///unique Dates
    List<String> uniqueDates = [];

    for (ExpenseModel eachExp in allExpenses) {
      var eachDate = mFormat.format(
          DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.created_at)));
      /*print(eachDate);*/
      var eachMonth = monthFormat.format(
          DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.created_at)));
      print(eachMonth);

      if (!uniqueDates.contains(eachDate)) {
        uniqueDates.add(eachDate);
      }
    }

    print(uniqueDates);

    /// getting all expenses for all unique dates
    for (String eachDate in uniqueDates) {
      List<ExpenseModel> eachDateExpenses = [];
      num amt = 0;

      for (ExpenseModel eachExp in allExpenses) {
        var eachExpDate = mFormat.format(
            DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.created_at)));

        if (eachExpDate == eachDate) {
          eachDateExpenses.add(eachExp);
          if (eachExp.eType == 0) {
            ///debit
            amt -= eachExp.amt;
          } else {
            ///credit
            amt += eachExp.amt;
          }
        }
      }

      allData.add(FilterExpenseModel(
          totalAmt: amt, title: eachDate, mExpenses: eachDateExpenses));
    }

    print(allData.length);
  }
}
