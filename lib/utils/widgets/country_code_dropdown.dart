import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/signup_controller.dart';
import '../constants/colors.dart';

List<String> countryCodeList = ["+880", "+91", "+86", "+92"];

Widget countryCodeDropDown(BuildContext context, double fieldWidth) {
  SignupController signupController = Get.put(SignupController());
  return SizedBox(
    width: fieldWidth,
    height: 40.0,
    child: DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 3.0, 0.0, 0.0),
        errorMaxLines: 1,
        errorStyle: TextStyle(
          fontSize: 12,
          height: 0.0,
        ),
        fillColor: inputFieldBgColor, //inputFieldBgColor,
        filled: true,
        //hintText: S.of(context).fullNameHelperTxt,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: inputFieldBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      icon: const Icon(
        Icons.expand_more,
        color: normalTextColor,
      ),
      value: countryCodeList[0],
      isExpanded: true,
      onChanged: (String? value) {
        signupController.updateCountryCode(value!);
      },
      onSaved: (String? value) {
        //updateGender(value!);
      },
      validator: (String? value) {},
      items: countryCodeList.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
            style: Theme.of(context).textTheme.bodyText2,
            //localKeyGender(context,val),
          ),
        );
      }).toList(),
    ),
  );
}
