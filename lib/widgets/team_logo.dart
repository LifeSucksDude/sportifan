import 'package:flutter/material.dart';

class TeamLogo extends StatelessWidget {
  final bool isActive;
  final String iconName;
  const TeamLogo({super.key, required this.isActive, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: 64,
              width: 64,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.50, color: Color(0xFF238F20)),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Container(
                width: 64,
                height: 64,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/${iconName}.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color.fromARGB(40, 163, 156, 156),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 64,
              height: 64,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/${iconName}.png'),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(40, 163, 156, 156),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          );
  }
}
