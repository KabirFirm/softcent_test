class ServerOTPModel{
  int otpCode;

  ServerOTPModel({required this.otpCode});

  factory ServerOTPModel.fromJson(Map<String, dynamic> parsedJson){
    return ServerOTPModel(
      otpCode: parsedJson['otp_code']
    );
  }
}