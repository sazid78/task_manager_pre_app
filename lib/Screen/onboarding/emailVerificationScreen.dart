import 'package:flutter/material.dart';
import 'package:task_manager_pre_app/Style/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
                    "Your Email Address",
                    style: HeadText(colorDarkBlue),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "A 6 digit verification pin will sent to your device",
                    style: Head6Text(colorDark),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("Email Address"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: SuccessButtonChild("Next"),
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
