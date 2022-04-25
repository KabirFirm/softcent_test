import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:softcent_test/main.dart' as app;

import 'robots/signup_robot.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  SignupRobot signupRobot;

  group('end-to-end test', () {
    testWidgets(
      'whole app',
          (WidgetTester tester) async {
        app.main();
        await tester.pumpAndSettle();
        signupRobot = SignupRobot(tester);

        await signupRobot.checkTermsAndConditions();
        await signupRobot.clickContinueButton();
        await signupRobot.enterMobileIncomplete();
        await signupRobot.clickContinueButton();
        await signupRobot.enterMobileComplete();
        await signupRobot.clickContinueButton();

      },
    );
  });
}