import 'package:flutter/material.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';

String? time = "00:20";

class AuthWidget extends StatelessWidget {
  final String mainText;
  final String secMainText;
  final TextEditingController controller;
  final Function() callback;
  final String hintText;
  final TextInputType inputType;

  AuthWidget({
    super.key,
    required this.mainText,
    required this.secMainText,
    required this.controller,
    required this.callback,
    required this.hintText,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 185 + 103,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              mainText,
              style: TextStyle(
                color: Color(0xFF262626),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              secMainText,
              style: TextStyle(
                color: Color(0xFF727272),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: inputType,
              controller: controller,
              cursorColor: Color(0xFFB5B5B5),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFFB5B5B5),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF238F20), width: 2.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF238F20), width: 2.0),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Try again after $time",
                    style: TextStyle(
                      color: Color(0xFF727272),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const Text(
                    "Retry",
                    style: TextStyle(
                      color: Color(0xFF238F20),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
                text: "Proceed",
                callback: callback,
                height: 48,
                width: 398,
                color: Color(0xFF238F20))
          ],
        ),
      ),
    );
  }
}
