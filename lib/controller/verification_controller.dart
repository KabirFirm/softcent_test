import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../models/server_otp.dart';
import '../utils/constants/network_constants.dart';

class VerificationController extends GetxController{
  var otpFilled = false.obs;
  var otpTyped = 0.obs;
  var isShowingCountDown = true.obs;
  int otpServer = 0;

  //String strDigits(int n) => n.toString().padLeft(2, '0');

  updateOTPTyped(int newValue){
    otpTyped.value = newValue;
  }

  updateIsShowingCountDown(bool newValue){
    isShowingCountDown.value = newValue;
  }

  updateOTPFilled(bool newValue){
    if(newValue){
      otpFilled.value = true;
    } else {
      otpFilled.value = false;
    }
  }

  void getOTP() async {
    final Uri url = Uri.parse(NetworkConstants.baseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ServerOTPModel serverOTP = ServerOTPModel.fromJson(jsonResponse);
      if(serverOTP.otpCode != null){
        print("server otp is = ${serverOTP.otpCode}");
        otpServer = serverOTP.otpCode;
      }
    }else {}
  }
}