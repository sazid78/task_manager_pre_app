

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_manager_pre_app/Style/style.dart';
import 'package:task_manager_pre_app/Utility/utility.dart';

var BaseURL = 'https://task.teamrabbil.com/api/v1';
var RequestHeader = {"Content-Type" : "application/json"};

Future<bool> LoginRequest(FormValues) async{
  var URL = Uri.parse("${BaseURL}/login");
  var PostBody = json.encode(FormValues);

  var response = await http.post(URL,headers: RequestHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody["status"] == "success"){
    SuccessToast("Request Success");
    await StoreUserData(ResultBody);
    return true;
  }else{
    ErrorToast("Request fail , please try again");
    return false;
  }
}

Future<bool> RegistrationRequest(FormValues) async{
  var URL = Uri.parse("${BaseURL}/registration");
  var PostBody = jsonEncode(FormValues);

  var response = await http.post(URL,headers: RequestHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = jsonDecode(response.body);

  if(ResultCode==200 && ResultBody["status"] == "success"){
    SuccessToast("Request Success");
    return true;
  }else{
    ErrorToast("Request fail , please try again");
    return false;
  }
}

Future<bool> VerifyEmailRequest(Email) async{
  var URL = Uri.parse("${BaseURL}/RecoverVerifyEmail/${Email}");

  var response = await http.get(URL,headers: RequestHeader);

  var ResultCode = response.statusCode;
  var ResultBody = jsonDecode(response.body);

  if(ResultCode==200 && ResultBody["status"] == "success"){
    SuccessToast("Request Success");
    return true;
  }else{
    ErrorToast("Request fail , please try again");
    return false;
  }
}

Future<bool> VerifyOTPRequest(Email,OTP) async{
  var URL = Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");

  var response = await http.get(URL,headers: RequestHeader);

  var ResultCode = response.statusCode;
  var ResultBody = jsonDecode(response.body);

  if(ResultCode==200 && ResultBody["status"] == "success"){
    SuccessToast("Request Success");
    return true;
  }else{
    ErrorToast("Request fail , please try again");
    return false;
  }
}

Future<bool> SetPasswordRequest(FormValues) async{
  var URL = Uri.parse("${BaseURL}/RecoverResetPass");
  var PostBody = jsonEncode(FormValues);

  var response = await http.post(URL,headers: RequestHeader,body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = jsonDecode(response.body);

  if(ResultCode==200 && ResultBody["status"] == "success"){
    SuccessToast("Request Success");
    return true;
  }else{
    ErrorToast("Request fail , please try again");
    return false;
  }
}