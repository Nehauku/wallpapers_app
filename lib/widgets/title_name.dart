import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;

  TitleName({this.firstTitle, this.secondTitle = ''});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstTitle,
          style: TextStyle(color: Colors.black),
        ),
        Text(
          secondTitle,
          style: TextStyle(color: Color(0xff97b2ac)),
        ),
      ],
    );
  }
}
