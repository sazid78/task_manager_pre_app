import 'package:flutter/material.dart';
import 'package:task_manager_pre_app/Style/style.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                    "Set Password",
                    style: HeadText(colorDarkBlue),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Minimum length password 8 character with Latter and number combination",
                    style: Head6Text(colorDark),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("Confirm Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: SuccessButtonChild("Confirm"),
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
