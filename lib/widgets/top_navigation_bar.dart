import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/screens/main/profile.dart';

class TopNavigationBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onNotificationIconTapped;
  const TopNavigationBar({
    super.key,
    required this.controller,
    required this.onNotificationIconTapped,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 68,
      decoration: ShapeDecoration(
        color: Color(0xFF238F20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onNotificationIconTapped,
              child: Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                child: Icon(
                  Icons.notifications,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 14),
            SizedBox(
              height: 38,
              width: 240,
              // color: Colors.white,
              child: TextField(
                controller: controller,
                cursorColor: Color(0xFFB5B5B5),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search Venue, Highlights",
                  hintStyle: TextStyle(
                    color: Color(0xFFB5B5B5),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF238F20)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF238F20)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            GestureDetector(
              onTap: () {
                if (!(ModalRoute.of(context)?.settings.name ==
                    '/ProfileView')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileView(),
                      settings: RouteSettings(name: '/ProfileView'),
                    ),
                  );
                }
              },
              child: Container(
                  width: 36,
                  height: 36,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: OvalBorder(),
                  ),
                  child: Image.asset(
                    'assets/Profile/Icon/user-profile.png',
                    fit: BoxFit.contain,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
