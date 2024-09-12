import 'package:expanses_task11/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

PreferredSizeWidget getMyAppBar(BuildContext context) => AppBar(
  actions: [
    IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 30,)),
    Switch.adaptive(value: context.watch<ThemeProvider>().getThemeValue(), onChanged: (value){
      context.read<ThemeProvider>().updateTheme(value);
    })
  ],
);



/*
class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final PreferredSizeWidget? bottom;

  MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 30,))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
}
class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
*/
