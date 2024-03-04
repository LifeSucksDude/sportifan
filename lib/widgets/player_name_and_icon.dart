import 'package:flutter/material.dart';

class PlayerNameAndIcon extends StatelessWidget {
  final String playerName;
  const PlayerNameAndIcon({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: ((width - 32) * 0.7) / 2,
      padding: const EdgeInsets.only(bottom: 9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Profile/Icon/Default.png',
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            playerName,
            style: TextStyle(
              color: Color(0xFF727272),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
