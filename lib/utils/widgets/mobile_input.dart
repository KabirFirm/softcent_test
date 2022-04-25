import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget mobileInputField(BuildContext context, TextEditingController textEditingController, double fieldWidth){
  return SizedBox(
    width: fieldWidth,
    height: 40.0,
    child: TextFormField(
      key: const Key('mobileInputTextField'),
      controller: textEditingController,
      style: Theme.of(context).textTheme.bodyText2,
      //initialValue: '5678',
      keyboardType: TextInputType.number,
      maxLength: 10,
      decoration: const InputDecoration(
        counterText: '',
        contentPadding:
        EdgeInsets.fromLTRB(10.0, 3.0, 0.0, 0.0),
        errorMaxLines: 1,
        errorStyle: TextStyle(
          fontSize: 12,
          height: 0.0,
        ),
        fillColor: inputFieldBgColor,
        filled: true,
        //hintText: "1612426024",
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
      validator: (value) {
        if (value!.isEmpty || value.length >10) {
          //registrationStore.updateErrorBoolValue("isRegistrationMobileError", true);
          return '';
        }
        //registrationStore.updateErrorBoolValue("isRegistrationMobileError", false);
        return null;
      },
      //onSaved: (val) => {print("value is $val")}
    ),
  );
}