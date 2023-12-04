import 'package:flutter/material.dart';
import 'package:task_manager_pre_app/Screen/onboarding/emailVerificationScreen.dart';
import 'package:task_manager_pre_app/Screen/onboarding/loginScreen.dart';
import 'package:task_manager_pre_app/Screen/onboarding/pinVerificationScreen.dart';
import 'package:task_manager_pre_app/Screen/onboarding/registrationScreen.dart';
import 'package:task_manager_pre_app/Screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager_pre_app/Screen/onboarding/splashScreen.dart';
import 'package:task_manager_pre_app/Screen/task/newTaskListScreen.dart';
import 'package:task_manager_pre_app/Utility/utility.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData("token");

  if(token==null){
    runApp( MyApp('/login'));

  }else{
    runApp(MyApp('/newTaskList'));
  }

}

class MyApp extends StatelessWidget {
  final String FirstRoute;
  MyApp(this.FirstRoute);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",
      initialRoute: '/login',
      routes: {
        '/':(context)=> SplashScreen(),
        '/login':(context)=> LoginScreen(),
        '/registration':(context)=> RegistrationScreen(),
        '/emailVerification':(context)=> EmailVerificationScreen(),
        '/pinVerification':(context)=> PinVerificationScreen(),
        '/setPassword':(context)=> SetPasswordScreen(),
        '/newTaskList':(context)=> NewTaskListScreen(),

      },
    );
  }
}
