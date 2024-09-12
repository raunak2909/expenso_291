import 'dart:ffi';

import 'package:expanses_task11/data/models/expense_model.dart';
import 'package:expanses_task11/domain/app_constants.dart';
import 'package:expanses_task11/ui/dashboard/bloc/expense_bloc.dart';
import 'package:expanses_task11/ui/dashboard/bloc/expense_event.dart';
import 'package:expanses_task11/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpensePage extends StatefulWidget {
  num balanceTillNow;
  AddExpensePage({required this.balanceTillNow});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController amtController = TextEditingController();

  int selectedIndex = -1;

  DateTime? selectedDate = DateTime.now();

  List<String> mType = ["Debit", "Credit"/*, "Loan", "Lend", "Borrow"*/];

  String selectedType = "Debit";
  bool typeSelected = false;
  DateFormat dtFormat = DateFormat.yMMMEd();

  ///bool isBtnEnabled = false;
  String errorMsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                mController: titleController,
                mHintText: "Enter your title here..",
                labelText: "Title"),
            SizedBox(
              height: 11,
            ),
            CustomTextField(
                mController: descController,
                mHintText: "Enter your desc here..",
                labelText: "Desc"),
            SizedBox(
              height: 11,
            ),
            CustomTextField(
                prefixIcon: Icons.currency_rupee,
                mController: amtController,
                mHintText: "Enter your Amount here..",
                labelText: "Amount"),
            SizedBox(
              height: 11,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11.0),
                            child: GridView.builder(
                                itemCount: AppConstants.mCat.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 11,
                                  crossAxisSpacing: 11,
                                ),
                                itemBuilder: (_, index) {
                                  return InkWell(
                                    onTap: () {
                                      selectedIndex = index;
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          AppConstants.mCat[index]['imgPath'],
                                          width: 50,
                                          height: 50,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(AppConstants.mCat[index]['name']),
                                      ],
                                    ),
                                  );
                                }),
                          );
                        });
                  },
                  child: selectedIndex == -1
                      ? Text('Select Category')
                      : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppConstants.mCat[selectedIndex]['imgPath'],
                          width: 40,
                          height: 40,
                        ),
                        Text(
                            " - ${AppConstants.mCat[selectedIndex]['name']}"),
                      ],
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)),
                      side: BorderSide(width: 1)),
                )),
            SizedBox(
              height: 11,
            ),
            DropdownMenu(
                textStyle:
                TextStyle(color: typeSelected ? Colors.black : Colors.grey),
                selectedTrailingIcon: Icon(Icons.keyboard_arrow_up),
                inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: typeSelected ? Colors.black : Colors.grey),
                    )),
                trailingIcon: Icon(
                  Icons.keyboard_arrow_down,
                  color: typeSelected ? Colors.black : Colors.grey,
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 16,
                initialSelection: selectedType,
                onSelected: (value) {
                  typeSelected = true;
                  selectedType = value!;
                  print(selectedType);
                  setState(() {});
                },
                dropdownMenuEntries: mType
                    .map((eachType) =>
                    DropdownMenuEntry(value: eachType, label: eachType))
                    .toList()),
            SizedBox(
              height: 11,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    selectedDate = await showDatePicker(context: context,
                        firstDate: DateTime(2022),
                        lastDate: DateTime(3000));
                    setState(() {

                    });
                  },
                  child: Text(dtFormat.format(selectedDate ?? DateTime.now())),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)),
                      side: BorderSide(width: 1)),
                )),
            SizedBox(
              height: 11,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String title = titleController.text.toString();
                  String desc = descController.text.toString();
                  String amt = amtController.text.toString();

                  if (title.isNotEmpty && desc.isNotEmpty && amt.isNotEmpty) {
                    if (selectedIndex != -1) {

                      num balance = widget.balanceTillNow;
                      num amt =  double.parse(amtController.text.toString());

                      ///update balance
                      if(selectedType=="Debit"){
                        balance -= amt;
                      } else {
                        balance += amt;
                      }

                      ///add expense

                      context.read<ExpenseBloc>().add(AddNewExpenseEvent(
                          newExpense: ExpenseModel(
                              cat_id: AppConstants.mCat[selectedIndex]['id'],
                              ///get uid from shared prefs
                              uid: 1,
                              eType: selectedType=="Debit" ? 0 : 1,
                              eTitle: titleController.text.toString(),
                              eDesc: descController.text.toString(),
                              amt: amt,
                              bal: balance,
                              created_at: selectedDate!=null ? selectedDate!.millisecondsSinceEpoch.toString() : DateTime.now().millisecondsSinceEpoch.toString()
                          )));

                      Navigator.pop(context);

                      errorMsg = "";
                      setState(() {

                      });
                    } else {
                      errorMsg = "Please select a category of the expense!!";
                      setState(() {

                      });
                    }
                  } else {
                    errorMsg = "Please fill all the required blanks!!";
                    setState(() {

                    });
                  }
                },
                child: Text('Add Expense'),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(errorMsg, style: TextStyle(color: Colors.red),),
          ],
        ),
      ),
    );
  }
}
