import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/screens/main/create_team.dart';
import 'package:sportifan_user/widgets/player.dart';

class AddPlayer extends StatelessWidget {
  final TextEditingController playerNameController;
  final TextEditingController ageController;
  final void Function(Player) onAdd;
  const AddPlayer({
    super.key,
    required this.playerNameController,
    required this.ageController,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 232,
            height: 36,
            child: TextField(
              textAlign: TextAlign.left,
              controller: playerNameController,
              cursorColor: Color(0xFFB5B5B5),
              decoration: InputDecoration(
                hintText: 'Player 1',
                hintStyle: TextStyle(
                  color: Color(0xFFB5B5B5),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBDDEBD), width: 1.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBDDEBD), width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            width: 58,
            height: 34,
            child: TextField(
              textAlign: TextAlign.left,
              controller: ageController,
              cursorColor: Color(0xFFB5B5B5),
              decoration: InputDecoration(
                hintText: 'Age',
                hintStyle: TextStyle(
                  color: Color(0xFFB5B5B5),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBDDEBD), width: 1.0),
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFBDDEBD), width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 0,
          ),
          Container(
            width: 40,
            child: TextButton(
              onPressed: () {
                onAdd(Player(
                  name: playerNameController.text,
                  age: int.parse(ageController.text),
                ));
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Color(0xFF238F20),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
            ),
          )
        ],
      ),
    );
  }
}
