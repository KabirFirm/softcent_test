import 'package:get/get.dart';

class SignupController extends GetxController{
  var showErrorText = false.obs;
  var checkBoxValue = false.obs;
  var mobileErrorText = "".obs;
  var countryCode = "+880".obs;

  void updateErrorTextValue(bool newValue){
    if(newValue){
      showErrorText.value = true;
    } else {
      showErrorText.value = false;
    }
  }

  void updateCheckBoxValue(){
    if(checkBoxValue.isTrue){
      checkBoxValue.toggle();
    } else {
      checkBoxValue.value = true; //or checkBoxValue.toggle();
    }
  }

  void updateMobileErrorText(String newText){
    mobileErrorText.value = newText;
  }

  void updateCountryCode(String newText){
    countryCode.value = newText;
  }
}