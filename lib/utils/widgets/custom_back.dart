import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget customBackButton(IconData iconData, double size){
  return Container(
    height: 42.0,
    width: 42.0,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1.0,
            color: backButtonBorderColor
      ),
      borderRadius: BorderRadius.circular(12)
    ),
    child: Icon(iconData, size: size,),

  );
}