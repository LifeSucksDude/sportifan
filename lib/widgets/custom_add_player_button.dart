import 'package:flutter/material.dart';

class AddPlayerButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddPlayerButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            child: Image.asset(
              'assets/images/+.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'Add Player',
            style: TextStyle(
              color: Color(0xFF238F20),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
