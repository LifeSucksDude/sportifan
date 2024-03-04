import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportifan_user/screens/main/choose_location.dart';
import 'package:sportifan_user/screens/main/select_date.dart';
import 'package:sportifan_user/widgets/sidebar.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';
import 'package:sportifan_user/widgets/venue_card.dart';

class BookingView extends StatelessWidget {
  BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Book a Venue',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ChooseLocation(
                                      controller: TextEditingController(),
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Kolkata',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF238F20),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              width: 28,
                              height: 28,
                              padding: const EdgeInsets.all(4),
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                              child: Icon(
                                Icons.location_on,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SelectDate(
                                  callback: () {},
                                );
                              },
                            );
                          },
                          child: Text(
                            '12 MON, 6am-7am',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF238F20),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(4),
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          child: Icon(
                            Icons.time_to_leave,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VenueCard(
                      rating: '3.5',
                      venueName: 'Laal Bagh Gully',
                      pricing: '₹ 250/hr',
                      location: 'Phool Bagan, Kankurgachi',
                      distance: '~ 7.1kms',
                    ),
                    SizedBox(height: 16),
                    VenueCard(
                      rating: '4.5',
                      venueName: 'Laal Bagh Gully',
                      pricing: '₹ 250/hr',
                      location: 'Phool Bagan, Kankurgachi',
                      distance: '~ 7.1kms',
                    ),
                    SizedBox(height: 16),
                    VenueCard(
                      rating: '3.5',
                      venueName: 'Laal Bagh Gully',
                      pricing: '₹ 250/hr',
                      location: 'Phool Bagan, Kankurgachi',
                      distance: '~ 7.1kms',
                    ),
                    SizedBox(height: 16),
                    VenueCard(
                      rating: '4.5',
                      venueName: 'Laal Bagh Gully',
                      pricing: '₹ 250/hr',
                      location: 'Phool Bagan, Kankurgachi',
                      distance: '~ 7.1kms',
                    ),
                    SizedBox(height: 16),
                    VenueCard(
                      rating: '3.5',
                      venueName: 'Laal Bagh Gully',
                      pricing: '₹ 250/hr',
                      location: 'Phool Bagan, Kankurgachi',
                      distance: '~ 7.1kms',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
