import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportifan_user/constants/colors_all.dart';
import 'package:sportifan_user/screens/homeview.dart';
import 'package:sportifan_user/widgets/custom_proceed_button.dart';
import 'package:sportifan_user/widgets/highlights_widget.dart';

class HighlightsView extends ConsumerWidget {
  final List<HighlightsWidget> highlights = [
    HighlightsWidget(),
    HighlightsWidget(),
    HighlightsWidget(),
    HighlightsWidget(),
    HighlightsWidget(),
    HighlightsWidget(),
    HighlightsWidget(),
    HighlightsWidget(),
    HighlightsWidget(),
  ];
  final bool highlightsExists;
  HighlightsView({
    super.key,
    required this.highlightsExists,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
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
                ref.read(counterProvider.notifier).update(0);
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
              'Highlights',
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
            if (highlightsExists)
              ...highlights
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: screenWidth - 32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
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
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
