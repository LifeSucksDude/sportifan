import 'package:flutter/material.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/widgets/sidebar.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';

class KeyMoment extends StatefulWidget {
  KeyMoment({super.key});

  @override
  State<KeyMoment> createState() => _KeyMomentState();
}

class _KeyMomentState extends State<KeyMoment> {
  int currentIndex = 0;

  void onPageChange(int index) {
    setState(() {});
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Key Moment ',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: Color.fromRGBO(251, 196, 1, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '1st Boundary ',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 16,
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
                    Stack(
                      alignment:
                          Alignment.center, // This will center the second image
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth - 32,
                              // height: 96,
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Image.asset(
                                'assets/images/VenueImage_dark.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                            'assets/images/play_circle_outline.png'), // Replace with your second image
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et olore magna aliqua. orem ipsum dolor sit amet,             ',
                        style: TextStyle(
                          color: Color(0xFF727272),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                ),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Teams',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_cricket),
                label: 'Highlights',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq),
                label: 'Stats',
              ),
            ],
            selectedItemColor:
                Color(0xFF238F20), // change this to your preferred color
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
