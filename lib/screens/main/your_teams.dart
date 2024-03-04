import 'package:flutter/material.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/screens/homeview.dart';
import 'package:sportifan_user/screens/main/bookings.dart';
import 'package:sportifan_user/screens/main/create_team.dart';
import 'package:sportifan_user/screens/main/edit_team.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/team_card.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YourTeams extends ConsumerStatefulWidget {
  const YourTeams({super.key});

  @override
  ConsumerState<YourTeams> createState() => _YourTeamsState();
}

class _YourTeamsState extends ConsumerState<YourTeams> {
  List<String> teamNames = [
    'TeamIcon',
    'TeamIcon2',
    'TeamIcon3',
    'TeamIcon4',
    'TeamIcon5',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController teamController = TextEditingController();
    TextEditingController uidController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
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
                      onTap: () {
                        ref.read(counterProvider.notifier).update(0);
                      },
                      child: Icon(
                        Icons.navigate_before,
                        size: 24,
                        color: ColorsAll.greenCol,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Your Teams',
                        style: TextStyle(
                          color: Color(0xFF262626),
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = 1; // Add this line
                            });
                          },
                          child: Text(
                            'New Team +',
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  teamNames.isEmpty
                      ? Container(
                          width: screenWidth - 32,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 32,
                              ),
                              Container(
                                width: 212.18,
                                height: 169,
                                child: Image.asset(
                                  'assets/images/empty_teams.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                'Oh So Empty !',
                                style: TextStyle(
                                  color: Color(0xFFFF0000),
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Create custom teams using phone number',
                                style: TextStyle(
                                  color: Color(0xFF727272),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              CustomButton(
                                text: 'Create Team',
                                callback: () {},
                                height: 40,
                                width: screenWidth - 32,
                                color: Color(0xFF238F20),
                              )
                            ],
                          ))
                      : Column(
                          children: teamNames
                              .map((teamName) => TeamCard(
                                    iconName: teamName,
                                    onDelete: () async {
                                      bool shouldDelete =
                                          await deleteDialog(context);
                                      if (shouldDelete) {
                                        setState(() {
                                          teamNames.remove(teamName);
                                        });
                                      }
                                    },
                                    onEdit: () {
                                      setState(() {
                                        _currentIndex =
                                            2; // Index of EditScreen in the IndexedStack
                                      });
                                    },
                                  ))
                              .toList(),
                        ),
                ],
              ),
            ),
            CreateTeam(
              teamController: teamController,
              uidController: uidController,
              onTeamCreated: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            EditTeam(
              teamController: teamController,
              uidController: uidController,
              onTeamEdited: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> deleteDialog(BuildContext context) {
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are your sure you want to delete',
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'team KKR ?',
                    style: TextStyle(
                      color: Color(0xFF262626),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
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
                  Navigator.of(context).pop(true);
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
