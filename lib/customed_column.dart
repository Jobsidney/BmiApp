import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnCustom extends StatelessWidget {
  final String? text;
  final IconData? icon;
  ColumnCustom({
    this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$text',
          style: TextStyle(color: Color(0xFFD5C9C9FF), fontSize: 18.0),
        ),
      ],
    );
  }
}
