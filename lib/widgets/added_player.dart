import 'package:flutter/material.dart';

class AddedPlayer extends StatelessWidget {
  final int sNo;
  final String playerName;
  final int age;
  final void Function() onDelete;
  const AddedPlayer({
    super.key,
    required this.sNo,
    required this.playerName,
    required this.age,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: screenWidth * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${sNo}.',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(width: 10), // Add space
                    Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(),
                      ),
                    ),
                    SizedBox(width: 10), // Add space
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$playerName ',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: '($age)',
                            style: TextStyle(
                              color: Color(0xFF727272),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: ShapeDecoration(
                color: Color(0xFFFDEDB3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              child: IconButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  iconSize: MaterialStateProperty.all(32),
                ),
                icon: Icon(
                  Icons.delete,
                  size: 32,
                  color: Color.fromRGBO(35, 143, 32, 1),
                ),
                onPressed: () {
                  onDelete();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
