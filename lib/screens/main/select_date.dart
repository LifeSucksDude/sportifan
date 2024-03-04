import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/text_tile.dart';

class SelectDate extends StatelessWidget {
  final Function() callback;
  const SelectDate({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
      width: screenWidth,
      height: 290,
      decoration: BoxDecoration(
        color: Color.fromRGBO(248, 248, 248, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: 80,
                height: 4,
                decoration: ShapeDecoration(
                  color: Color(0xFFA9A9A9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Select Date',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 27,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 16,
                            ),
                            TextTile(tilename: 'Nearby'),
                            TextTile(tilename: 'Exclude Sold Out'),
                            TextTile(tilename: 'Exclude Sold Out'),
                            TextTile(tilename: 'Exclude Sold Out'),
                            TextTile(tilename: 'Exclude Sold Out')
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Select Date',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 27,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 16,
                            ),
                            TextTile(tilename: 'Nearby'),
                            TextTile(tilename: 'Exclude Sold Out'),
                            TextTile(tilename: 'Exclude Sold Out'),
                            TextTile(tilename: 'Exclude Sold Out'),
                            TextTile(tilename: 'Exclude Sold Out')
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: CustomButton(
              text: "Proceed",
              callback: callback,
              height: 48,
              width: 398,
              color: Color(0xFF238F20),
            ),
          )
        ],
      ),
    ));
  }
}
