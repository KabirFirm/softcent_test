import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:softcent_test/utils/constants/colors.dart';
import 'package:softcent_test/utils/widgets/custom_back.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../controller/signup_controller.dart';
import '../controller/verification_controller.dart';

class OTPVerificationScreen extends StatelessWidget {
  final double deviceHeight;
  final double deviceWidth;
  final String mobile;

  OTPVerificationScreen(
      {Key? key,
      required this.mobile,
      required this.deviceHeight,
      required this.deviceWidth})
      : super(key: key);

  TextEditingController otpController = TextEditingController();
  final VerificationController verificationController =
      Get.put(VerificationController());

  final SignupController _signupController = Get.find();

  @override
  Widget build(BuildContext context) {
    verificationController.getOTP();
    return GestureDetector( // GestureDetector is used to dismiss keyboard if tap any part of screen
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView( //SingleChildScrollView is used to resize screen if keyboard hide input field.
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 48.0,
                ),
                InkWell(
                    onTap: () {
                      // GetX default back is used which is similar to Navigator.pop()
                      Get.back();
                    },
                    child: customBackButton(Icons.close, 20.0)),

                //image section, image comes from asset
                Container(
                  //color: themeColor,
                  height: deviceHeight * 0.32,
                  child: Center(
                      child: Image.asset(
                    "assets/images/bg_home.jpg",
                  )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: Text(
                  "Verification Code",
                  style: Theme.of(context).textTheme.headline2,
                )),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                    child: Text(
                  "Please type the code we sent to",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                    child: Text(
                  mobile, // formatted mobile number comes from signup screen
                  style: Theme.of(context).textTheme.bodyText2,
                )),
                const SizedBox(
                  height: 30.0,
                ),

                // This is pin code entry section
                PinCodeTextField(
                    appContext: context,
                    controller: otpController,
                    length: 5,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 60),
                    //cursorColor: Colors.lightGreen,
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 45,
                      activeColor: otpFieldBgColor,
                      selectedFillColor: otpFieldBgColor,
                      disabledColor: otpFieldBgColor,
                      errorBorderColor: otpFieldBgColor,
                      inactiveFillColor: otpFieldBgColor,
                      inactiveColor: otpFieldBgColor,
                      selectedColor: themeColor,
                      activeFillColor: otpFieldBgColor,
                    ),
                    cursorColor: themeColor,
                    onCompleted: (value) {
                      debugPrint("completed $value");
                      verificationController.updateOTPFilled(true); //if OTP entered complete, then visible/active Next button
                    },
                    onChanged: (value) {
                      value.length < 5
                          ? verificationController.updateOTPFilled(false) //if entered otp length is less than 5, then keep inactive Next button
                          : null;
                      value != ""
                          ? verificationController
                              .updateOTPTyped(int.parse(value))
                          : print('null value');
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Code Sent. Try again in ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Obx(
                      () => verificationController.isShowingCountDown.value ==
                              true
                          ? TweenAnimationBuilder<Duration>( //Animation is used for timer countdown
                              duration: const Duration(minutes: 1, seconds: 59),
                              tween: Tween(
                                  begin:
                                      const Duration(minutes: 1, seconds: 59),
                                  end: Duration.zero),
                              onEnd: () {
                                print('Timer ended');
                                verificationController
                                    .updateIsShowingCountDown(false);
                              },
                              builder: (BuildContext context, Duration value,
                                  Widget? child) {
                                String strDigits(int n) => n.toString().padLeft(2, '0'); //to show two digits for minute and second
                                final minutes = strDigits(value.inMinutes);
                                final seconds = strDigits(value.inSeconds % 60);
                                return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text('$minutes:$seconds',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6));
                              })
                          : Text("Resend",
                              style: Theme.of(context).textTheme.headline6),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Obx(
                  () => ElevatedButton(
                      onPressed: verificationController.otpFilled.value == true
                          ? () {
                              if (verificationController.otpTyped.value ==
                                  verificationController.otpServer) {
                                Get.defaultDialog( //default dialog from GetX
                                  title: "WOW! OTP matched",
                                  titleStyle: const TextStyle(
                                      color: themeColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  middleText:
                                      "Your entered OTP matched with OTP we sent",
                                  middleTextStyle:
                                      const TextStyle(color: themeColor),
                                  confirm: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: themeColor),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("OK")),
                                );
                              } else {
                                Get.defaultDialog(
                                  title: "OOPPS! OTP mismatched",
                                  titleStyle: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  middleText:
                                      "Your entered OTP doesn't match with OTP we sent",
                                  middleTextStyle:
                                      const TextStyle(color: Colors.red),
                                  confirm: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: themeColor),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("OK")),
                                );
                              }
                            }
                          : null,
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith<Size>(
                          (states) =>
                              Size(MediaQuery.of(context).size.width, 46.0),
                        ),
                        shape: MaterialStateProperty.resolveWith<
                                RoundedRectangleBorder>(
                            (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.grey; // Disabled color
                          }
                          return themeColor; // Regular color
                        }),
                      ),
                      child: const Center(
                        child: Text("Next"),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
