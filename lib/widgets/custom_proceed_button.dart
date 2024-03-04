import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() callback;
  final double height;
  final double width;
  final Color color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.callback,
    required this.height, // default value
    required this.width, // default value
    required this.color, // default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color,
            minimumSize: Size(width, height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        onPressed: () => callback(),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    );
  }
}
