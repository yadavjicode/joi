import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:joi/app/user/dashboard/dashboard.dart';
import 'package:joi/app/util/custom/addtext/AddText.dart';
import 'package:joi/app/util/custom/custombutton/CustomButton.dart';
import 'package:joi/app/util/custom/customcolor/CustomColor.dart';
import 'package:joi/app/util/custom/customtextfeild/CustomTextFeild.dart';

class Feild extends StatefulWidget {
  const Feild({super.key});

  @override
  State<Feild> createState() => _FeildState();
}

class _FeildState extends State<Feild> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 40,
                child: CustomTextField(
                  controller: name,
                  maxlength: 10,
                )),
            CustomButton(
              text: AddText.name,
              color: CustomColor.backgroundColor,
              onPressed: () => Dashboard(),
            )
          ],
        ),
      ),
    );
  }
}
