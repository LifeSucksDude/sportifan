import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/screens/main/edit_team.dart';
import 'package:sportifan_user/screens/main/your_teams.dart';

class TeamCard extends StatelessWidget {
  final VoidCallback onEdit;
  final String iconName;
  final VoidCallback onDelete;

  const TeamCard(
      {super.key,
      required this.iconName,
      required this.onDelete,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    TextEditingController teamController = TextEditingController();
    TextEditingController uidController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: screenWidth - 32,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KKR',
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  '12 players',
                  style: TextStyle(
                    color: Color(0xFF727272),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: onEdit,
              child: Text(
                'Edit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF238F20),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 32,
              height: 32,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
              ),
              child: GestureDetector(
                onTap: () async {
                  bool shouldDelete = await deleteDialog(context);
                  if (shouldDelete) {
                    onDelete();
                  }
                },
                child: Icon(
                  Icons.delete,
                  size: 32,
                  color: Color.fromRGBO(35, 143, 32, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
