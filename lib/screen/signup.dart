import 'package:flutter/material.dart';
import 'package:softcent_test/utils/constants/colors.dart';
import 'package:softcent_test/utils/widgets/country_code_dropdown.dart';
import 'package:softcent_test/utils/widgets/custom_back.dart';
import 'package:softcent_test/utils/widgets/mobile_input.dart';
import 'package:get/get.dart';

import '../controller/signup_controller.dart';
import 'otp_verification.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final SignupController signupController = Get.put(SignupController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 56.0,
              ),
              customBackButton(Icons.chevron_left, 32.0), //this is custom and reusable
              const SizedBox(
                height: 42.0,
              ),
              Center(
                  child: Text(
                "Test Task",
                style: Theme.of(context).textTheme.headline1,
              )),
              const SizedBox(
                height: 36.0,
              ),
              Text(
                "Phone Number",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 10.0,
              ),

              // This is country code and mobile enter section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  countryCodeDropDown(context, deviceWidth * 0.25),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mobileInputField(
                          context, mobileController, deviceWidth * 0.6),
                      Obx(
                        () => Visibility(
                          visible: signupController.showErrorText.value,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(3.0, 3.0, 0.0, 0.0),
                            child: Text(signupController.mobileErrorText.value,
                                style: Theme.of(context).textTheme.labelMedium,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),

              // This is Terms and Conditions checkbox section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Checkbox(
                      key: const Key('checkBox'),
                        value: signupController.checkBoxValue.value,
                        activeColor: themeColor,
                        onChanged: (bool? newValue) {
                          signupController.updateCheckBoxValue();
                        }),
                  ),
                  Text("You agree to our ",
                      style: Theme.of(context).textTheme.bodyText1),
                  Text("Terms & Conditions",
                      style: Theme.of(context).textTheme.headline6)
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),

              // This is continue button
              Obx(
                () => ElevatedButton(
                  key: const Key('continueBtn'),

                    // Continue button will be inactive if terms and conditions check is not true
                    onPressed: signupController.checkBoxValue.value == true
                        ? () {
                            if (mobileController.text.isEmpty) {
                              signupController.updateMobileErrorText(
                                  "Mobile Number can't be empty");
                              signupController.updateErrorTextValue(true);
                              return;
                            }
                            // mobile number should be 10 digits, so check it
                            if (mobileController.text.length != 10) {
                              signupController.updateMobileErrorText(
                                  "Oops! pls enter 10 digit number");
                              signupController.updateErrorTextValue(true);
                              return;
                            }
                            signupController.updateErrorTextValue(false);

                            // if keyboard is visible, then close before going to next page
                            FocusManager.instance.primaryFocus?.unfocus();

                            // Taking entered mobile number and formatted as per design of next screen
                            String inputMobile = mobileController.text;
                            String modifiedMobile =
                                signupController.countryCode +
                                    " " +
                                    inputMobile.substring(0, 4) +
                                    " " +
                                    inputMobile.substring(4, 7) +
                                    " " +
                                    inputMobile.substring(7, 10);

                            // GetX is used to navigate to next screen
                            Get.to(() => OTPVerificationScreen(
                                mobile: modifiedMobile,
                                deviceHeight: deviceHeight,
                                deviceWidth: deviceWidth));
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
                      child: Text("Continue"),
                    )),
              ),

              // This is Signin section
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don\'t have an account? ",
                      style: Theme.of(context).textTheme.bodyText1),
                  Text(
                    "Sign in",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
