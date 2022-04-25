import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:softcent_test/screen/signup.dart';
import 'package:softcent_test/utils/constants/colors.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            //primarySwatch: Colors.blue,//themeColor
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold, color: themeColor),
              headline2: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500, color: normalTextColor),
              headline5: TextStyle(color: themeColor, fontSize: 15.0, fontWeight: FontWeight.normal),
              headline6: TextStyle(color: themeColor, fontSize: 15.0, fontWeight: FontWeight.normal),
              bodyText1: TextStyle(color: otherDeepTextColor, fontSize: 15.0, fontWeight: FontWeight.normal),
              bodyText2: TextStyle(color: otherDeepTextColor, fontSize: 17.0, fontWeight: FontWeight.normal),
              labelMedium: TextStyle(color: redColor, fontSize: 13.0, fontWeight: FontWeight.normal),

            ),
            primaryColor: themeColor,
            scaffoldBackgroundColor: whiteColor,
          ),
          home: SignupScreen(),
    );
  }
}



