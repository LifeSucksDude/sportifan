import 'package:flutter/material.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';

class AddName extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function() callback;
  AddName(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 185 + 103,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Text("Enter your Profile name"),
            SizedBox(
              height: 20,
            ),
            TextField(
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
              height: 108 + 12,
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
