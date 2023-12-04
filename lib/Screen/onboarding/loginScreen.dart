import 'package:flutter/material.dart';
import 'package:task_manager_pre_app/Api/apiClient.dart';
import 'package:task_manager_pre_app/Screen/onboarding/registrationScreen.dart';
import 'package:task_manager_pre_app/Style/style.dart';
import 'package:task_manager_pre_app/Utility/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map<String, String > FormValues = {"email":"","password": ""};
  bool Loading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  FormOnSubmit() async{
    if(FormValues["email"]!.length==0){
      ErrorToast("Email Required");
    }else if(FormValues["password"]!.length==0){
      ErrorToast("Password Required");
    }else{
      setState(() {
        Loading =true;
      });

    bool res = await LoginRequest(FormValues);

    if(res == true){

      Navigator.pushNamedAndRemoveUntil(context, "/newTaskList", (route) => false);
    }else{
      setState(() {
        Loading =false;
      });
    }



    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ScreenBackground(context),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Loading?(Center(child: CircularProgressIndicator())):(SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Get Started With",
                  style: HeadText(colorDarkBlue),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  "Learn with rabbil hasan",
                  style: Head6Text(colorDark),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (TextValue){
                    InputOnChange("email", TextValue);
                  },
                  decoration: AppInputDecoration("Email Address"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (TextValue){
                    InputOnChange("password", TextValue);
                  },
                  decoration: AppInputDecoration("Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      FormOnSubmit();
                    },
                    child: SuccessButtonChild("Login"),
                    style: AppButtonStyle(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "/emailVerification");
                        },
                        child: Text("Forget Password?",style: Head6Text(colorLightGray),),
                      ),
                      
                      SizedBox(height: 15,),

                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "/registration");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have a account?",style: Head6Text(colorDarkBlue),),
                            SizedBox(width: 10,),
                            Text("Sign Up?",style: Head6Text(colorGreen),)
                          ],
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        )
      ],
    ));
  }
}
