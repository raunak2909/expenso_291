import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle mTextStyle30({
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
}){
  return TextStyle(
    fontSize: 30,
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: 'fontMain'
  );
}

TextStyle mTextStyle18({
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
}){
  return TextStyle(
      fontSize: 18,
      color: fontColor,
      fontWeight: fontWeight,
      fontFamily: 'fontMain'
  );
}

TextStyle mTextStyle15({
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
}){
  return TextStyle(
      fontSize: 15,
      color: fontColor,
      fontWeight: fontWeight,
      fontFamily: 'fontMain'
  );
}
TextStyle mTextStyle11({
  bool isLight = false,
  Color fontColor = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
}){
  return TextStyle(
      fontSize: 11,
      color: isLight ? fontColor : Colors.white,
      fontWeight: fontWeight,
      fontFamily: 'fontMain'
  );
}