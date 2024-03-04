import 'package:flutter/material.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/profile_icon.dart';
import 'package:sportifan_user/widgets/profile_text_and_textfield.dart';
import 'package:sportifan_user/widgets/profile_widget.dart';
import 'package:sportifan_user/widgets/sidebar.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xFF238F20),
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(72.0), // Set the height here
            child: TopNavigationBar(
              controller: controller,
              onNotificationIconTapped: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
          drawer: SideBar(
            notificationExists: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.navigate_before,
                            size: 24,
                            color: ColorsAll.greenCol,
                          ),
                        ),
                        Text(
                          'Logout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF0000),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: screenWidth - 32,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: ShapeDecoration(
                        color: Color(0xFFFDEDB3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your Avatar',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: 64,
                            height: 64,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/Profile/Icon/user-profile3.png',
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
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
                                        Icons.edit,
                                        size: 16,
                                        color: Color.fromRGBO(35, 143, 32, 1),
                                      ),
                                    ),
                                  ),
                                  right: 0,
                                  bottom: 0,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Bio',
                                style: TextStyle(
                                  color: Color(0xFF727272),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: TextField(
                              controller: controller,
                              cursorColor: Color(0xFFB5B5B5),
                              maxLines: null,
                              // textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Write something about yourself',
                                hintStyle: TextStyle(
                                  color: Color(0xFFB5B5B5),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ProfileTextAndTextfield(
                      text: 'Username',
                      hintText: 'Praty Monster',
                    ),
                    ProfileTextAndTextfield(
                      text: 'Email ID',
                      hintText: 'XXXXX@gmail.com',
                    ),
                    ProfileTextAndTextfield(
                      text: 'Phone Number',
                      hintText: '9837749500',
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Your Past Bookings',
                      style: TextStyle(
                        color: Color(0xFF727272),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ProfileWidget(),
                    ProfileWidget(),
                    ProfileWidget(),
                    ProfileWidget(),
                    ProfileWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> showProfileDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      double screenWidth = MediaQuery.of(context).size.width;
      return Dialog(
        insetPadding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Border radius here
        ),
        backgroundColor: Color(0xFFF7F7F7),
        child: Padding(
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
                  SizedBox(
                    width: 241,
                    child: Text(
                      'Choose Avatar',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
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
                height: 33,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: ShapeDecoration(
                            color: Color.fromRGBO(225, 230, 240, 1),
                            shape: OvalBorder(),
                          ),
                          child: Icon(
                            Icons.image,
                            size: 24,
                            color: Color.fromRGBO(115, 115, 115, 1),
                          ),
                        ),
                        ProfileIcon(
                          isActive: false,
                        ),
                        ProfileIcon(
                          isActive: true,
                        ),
                        ProfileIcon(
                          isActive: false,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileIcon(
                          isActive: false,
                        ),
                        ProfileIcon(
                          isActive: false,
                        ),
                        ProfileIcon(
                          isActive: false,
                        ),
                        ProfileIcon(
                          isActive: false,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileIcon(
                          isActive: false,
                        ),
                        ProfileIcon(
                          isActive: false,
                        ),
                        ProfileIcon(
                          isActive: false,
                        ),
                        ProfileIcon(
                          isActive: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              CustomButton(
                  text: 'Save',
                  callback: () {},
                  height: 40,
                  width: screenWidth - 64,
                  color: Color(0xFF238F20))
            ],
          ),
        ),
      );
    },
  ).then((value) => value ?? false);
}
