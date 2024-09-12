import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  double mWidth;
  int minLines;
  TextEditingController mController;
  String mHintText;
  String labelText;
  IconData? prefixIcon;
  TextInputType mKeyboardType;

  CustomTextField({this.minLines=1, this.mWidth = double.infinity, required this.mController, required this.mHintText, required this.labelText, this.prefixIcon, this.mKeyboardType=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mWidth,
      child: TextField(
        minLines: minLines,
        maxLines: minLines+2,
        keyboardType: mKeyboardType,
        controller: mController,
        decoration: InputDecoration(
          hintText: mHintText,
          label: Text(labelText),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          enabledBorder: getMyBorder(),
          focusedBorder: getMyBorder(borderColor: Colors.blue),
        ),
      ),
    );
  }

  InputBorder getMyBorder(
      {Color borderColor = Colors.black,
      double borderRadius = 11,
      double borderWidth = 1.0}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}
