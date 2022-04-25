import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class SignupRobot{
  final WidgetTester tester;
  SignupRobot(this.tester);

  Future<void> checkTermsAndConditions() async{
    print('calling checkTermsAndConditions');
    final checkTermsAndConditionsFinder = find.byKey(const Key('checkBox'));

    await tester.ensureVisible(checkTermsAndConditionsFinder);
    await tester.tap(checkTermsAndConditionsFinder);

    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }

  Future<void> clickContinueButton() async{
    print('calling clickContinueButton');
    final continueButtonFinder = find.byKey(const Key('continueBtn'),);

    await tester.ensureVisible(continueButtonFinder);
    await tester.tap(continueButtonFinder);

    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }

  Future<void> enterMobileIncomplete() async{
    print('calling enterMobile');
    final textFieldFinder = find.byKey(const Key('mobileInputTextField'));
    await tester.enterText(textFieldFinder, '161');
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }

  Future<void> enterMobileComplete() async{
    print('calling enterMobile');
    final textFieldFinder = find.byKey(const Key('mobileInputTextField'));
    await tester.enterText(textFieldFinder, '1612426024');
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 2));
  }
}