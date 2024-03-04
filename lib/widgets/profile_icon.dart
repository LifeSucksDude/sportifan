import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/screens/main/profile.dart';

class ProfileIcon extends StatefulWidget {
  final bool isActive;
  const ProfileIcon({super.key, required this.isActive});

  @override
  State<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      child: Stack(
        children: [
          Image.asset(
            'assets/Profile/Icon/user-profile3.png',
            fit: BoxFit.cover,
          ),
          Visibility(
            visible: widget.isActive,
            child: Positioned(
              child: GestureDetector(
                onTap: () async {
                  if (await showProfileDialog(context)) {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x28000000),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    size: 16,
                    color: Color.fromRGBO(35, 143, 32, 1),
                  ),
                ),
              ),
              right: 0,
              top: 0,
            ),
          )
        ],
      ),
    );
  }
}
