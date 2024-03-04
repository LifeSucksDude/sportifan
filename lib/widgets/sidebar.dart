import 'package:flutter/material.dart';
import 'package:sportifan_user/widgets/notification_card.dart';

// Responsiveness is added to the widget

class SideBar extends StatelessWidget {
  final bool notificationExists;
  const SideBar({super.key, required this.notificationExists});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: const Color(0xFFFAFAFA),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      width: screenWidth * 0.678,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.0666, horizontal: screenWidth * 0.0444),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                color: const Color(0xFF262626),
                fontSize: screenWidth * 0.055,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            notificationExists
                ? Column(
                    children: [
                      SizedBox(
                        height: screenWidth * 0.0555,
                      ),
                      const NotificationCard(
                        field: 'Highlights',
                        notificationIcon: Icons.sports_cricket,
                      ),
                      const NotificationCard(
                        field: 'Stats',
                        notificationIcon: Icons.graphic_eq,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenWidth * 0.0944,
                      ),
                      SizedBox(
                        width: screenWidth * 0.52,
                        height: screenWidth * 0.392,
                        child: Image.asset(
                          'assets/images/empty_notifications.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 0.0666,
                      ),
                      SizedBox(
                        width: screenWidth * 0.52,
                        child: Text(
                          'You Have No New Notifications ',
                          textAlign: TextAlign.center,
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
                  )
          ],
        ),
      ),
    );
  }
}
