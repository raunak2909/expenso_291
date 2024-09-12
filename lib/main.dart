import 'package:expanses_task11/data/local/db_helper.dart';
import 'package:expanses_task11/theme_provider.dart';
import 'package:expanses_task11/ui/dashboard/bloc/expense_bloc.dart';
import 'package:expanses_task11/ui/dashboard/dashBoard_page.dart';
import 'package:expanses_task11/login_page.dart';
import 'package:expanses_task11/sign_up_page.dart';
import 'package:expanses_task11/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(dbHelper: DBHelper.getInstance),
    child: ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
            displayLarge: TextStyle(fontSize: 30,) ,
            displayMedium: TextStyle(fontSize: 18)
        ),
      ),
      themeMode: context.watch<ThemeProvider>().getThemeValue() ? ThemeMode.dark : ThemeMode.light,
      ///light/day theme
      theme: ThemeData(
          brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          background: Colors.white,
          seedColor: Colors.blue
        ),
        textTheme: TextTheme(
         displayLarge: TextStyle(fontSize: 30,) ,
          displayMedium: TextStyle(fontSize: 18),
        ),
        canvasColor: Colors.white,
        useMaterial3: true
      ),
      home: DashBoardPage(),
    );
  }
}
