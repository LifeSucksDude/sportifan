import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/widgets/add_player.dart';
import 'package:sportifan_user/widgets/added_player.dart';
import 'package:sportifan_user/widgets/custom_add_player_button.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/player.dart';
import 'package:sportifan_user/widgets/team_logo.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';

class EditTeam extends StatefulWidget {
  final Function onTeamEdited;
  final TextEditingController teamController;
  final TextEditingController uidController;
  const EditTeam(
      {super.key,
      required this.teamController,
      required this.uidController,
      required this.onTeamEdited});

  @override
  State<EditTeam> createState() => _EditTeamState();
}

class _EditTeamState extends State<EditTeam> {
  List<Player> players = [];
  Player? userPlayer;
  bool isAddPlayerVisible = false;

  @override
  void initState() {
    super.initState();
    userPlayer = Player(name: 'user', age: 23); // Initialize userPlayer here
  }

  void addPlayer(Player player) {
    setState(() {
      players.add(player);
      isAddPlayerVisible = false;
    });
  }

  void removePlayer(int index) {
    setState(() {
      players.removeAt(index);
    });
  }

  void removeUserPlayer() {
    setState(() {
      userPlayer = null;
    });
  }

  void editTeam() {
    widget.onTeamEdited();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController ageController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController playerNameController = TextEditingController();
    TextEditingController controller = TextEditingController();
    final GlobalKey addedPlayerKey = GlobalKey();
    double addedPlayerHeight =
        addedPlayerKey.currentContext?.size?.height ?? 56;
    return WillPopScope(
      onWillPop: () async {
        return await showLogoutDialog(context, editTeam);
      },
      child: SafeArea(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(4),
                          decoration: ShapeDecoration(
                            color: Color.fromRGBO(248, 248, 248, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              size: 20,
                            ),
                            onTap: () async {
                              if (await showLogoutDialog(context, editTeam)) {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Edit Team',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Enter your team name',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 48,
                          child: TextField(
                            textAlign: TextAlign.left,
                            controller: widget.teamController,
                            cursorColor: Color(0xFFB5B5B5),
                            decoration: InputDecoration(
                              hintText: 'JOJOS',
                              hintStyle: TextStyle(
                                color: Color(0xFFB5B5B5),
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF238F20), width: 2.0),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF238F20), width: 2.0),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Choose Team Logo  ',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 64,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        TeamLogo(isActive: true, iconName: 'TeamIcon'),
                        TeamLogo(isActive: false, iconName: 'TeamIcon2'),
                        TeamLogo(isActive: false, iconName: 'TeamIcon5'),
                        TeamLogo(isActive: false, iconName: 'TeamIcon3'),
                        TeamLogo(isActive: false, iconName: 'TeamIcon4'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Team Members',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Add members using their phone number',
                                style: TextStyle(
                                  color: Color(0xFF727272),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 48,
                          child: TextField(
                            textAlign: TextAlign.left,
                            controller: widget.uidController,
                            cursorColor: Color(0xFFB5B5B5),
                            decoration: InputDecoration(
                              hintText: '“XXX-XXXX”',
                              hintStyle: TextStyle(
                                color: Color(0xFFBDDEBD),
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF238F20), width: 2.0),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF238F20), width: 2.0),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Color(0xFFBDDEBD),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16,
                    ),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Color(0xFFFBC400),
                      strokeWidth: 3,
                      radius: Radius.circular(8),
                      padding: EdgeInsets.zero,
                      child: IntrinsicHeight(
                        child: Container(
                          width: screenWidth - 32,
                          // height: 120,
                          decoration: BoxDecoration(
                            color: Color(0xFFFDEDB3),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (userPlayer != null)
                                AddedPlayer(
                                  sNo: 1,
                                  playerName: 'user',
                                  age: 23,
                                  onDelete: removeUserPlayer,
                                ),
                              if (userPlayer == null)
                                Container(
                                  height: addedPlayerHeight,
                                  color: Colors.transparent,
                                ),
                              ...players.asMap().entries.map((entry) {
                                int index = entry.key;
                                Player player = entry.value;

                                return AddedPlayer(
                                  sNo: index + 1,
                                  playerName: player.name,
                                  age: player.age,
                                  onDelete: () => removePlayer(index),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (isAddPlayerVisible)
                    AddPlayer(
                      playerNameController: playerNameController,
                      ageController: ageController,
                      onAdd: addPlayer,
                    ),
                  AddPlayerButton(
                    onPressed: () {
                      setState(() {
                        isAddPlayerVisible =
                            true; // Show AddPlayer widget when button is clicked
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomButton(
                      text: 'Save',
                      callback: () {},
                      height: 42,
                      width: screenWidth - 32,
                      color: Color(0xFF238F20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> showLogoutDialog(BuildContext context, Function editTeam) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Border radius here
        ),
        backgroundColor: Color(0xFFF7F7F7),
        contentPadding: EdgeInsets.zero,
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.info_outline,
                        color: Color.fromRGBO(255, 0, 0, 1),
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Color.fromRGBO(115, 115, 115, 1),
                      )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Are your sure you want to discard ?',
                style: TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Text(
                'Changes wont be saved !',
                style: TextStyle(
                  color: Color(0xFF727272),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              )
            ],
          ),
        ),
        actionsPadding: EdgeInsets.all(4),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  editTeam();
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: screenWidth * 0.3,
                  height: 48,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF238F20)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Yes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF238F20),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  width: screenWidth * 0.3,
                  height: 48,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    color: Color(0xFF238F20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'No',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
