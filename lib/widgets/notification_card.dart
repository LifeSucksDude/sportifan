import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String field;
  final IconData? notificationIcon;

  const NotificationCard(
      {super.key, required this.field, required this.notificationIcon});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.0444),
      child: Container(
        width: screenWidth * 0.589,
        height: screenWidth * 0.255,
        padding: EdgeInsets.all(screenWidth * 0.0333),
        decoration: ShapeDecoration(
          color: const Color(0xFFFDEDB3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  notificationIcon,
                  color: const Color(0xFF727272),
                  size: screenWidth * 0.0666,
                ),
                SizedBox(
                  height: screenWidth * 0.0222,
                ),
                SizedBox(
                  width: screenWidth * 0.419,
                  child: Text(
                    'Your $field have been generated ',
                    style: TextStyle(
                      color: const Color(0xFF727272),
                      fontSize: screenWidth * 0.0333,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward,
              color: const Color.fromRGBO(35, 143, 32, 1),
              size: screenWidth * 0.0666,
            ),
          ],
        ),
      ),
    );
  }
}
