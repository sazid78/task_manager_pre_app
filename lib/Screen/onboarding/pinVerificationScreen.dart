import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_pre_app/Style/style.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            ScreenBackground(context),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pin Verification",
                    style: HeadText(colorDarkBlue),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "A 6 digit pin has been send to your mobile number",
                    style: Head6Text(colorDark),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PinCodeTextField(
                      appContext: context,
                      length: 6,
                    pinTheme: AppOTPStyle(),
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v){

                    },
                    onChanged: (value){

                    },
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: SuccessButtonChild("Verify"),
                      style: AppButtonStyle(),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
