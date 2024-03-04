import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportifan_user/screens/main/bookings.dart';
import 'package:sportifan_user/screens/main/choose_match.dart';
import 'package:sportifan_user/screens/main/create_team.dart';
import 'package:sportifan_user/screens/main/edit_team.dart';
import 'package:sportifan_user/screens/main/highlights.dart';
import 'package:sportifan_user/screens/main/stats.dart';
import 'package:sportifan_user/screens/main/venue_screen.dart';
import 'package:sportifan_user/screens/main/your_teams.dart';
import 'package:sportifan_user/widgets/highlights_widget.dart';
import 'package:sportifan_user/widgets/sidebar.dart';
import 'package:sportifan_user/widgets/top_navigation_bar.dart';

final counterProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void update(int value) {
    state = value;
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int currentIndex = 0;

  final List<Widget> _pages = [
    BookingView(),
    YourTeams(),
    HighlightsView(highlightsExists: true),
    StatsView(statsExists: true),
  ];

  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      ref.read(counterProvider.notifier).update(index);
    }

    TextEditingController teamController = TextEditingController();
    TextEditingController uidController = TextEditingController();
    TextEditingController controller = TextEditingController();
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
          body: IndexedStack(
            index: ref.watch(counterProvider),
            children: _pages,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Color(0xFF238F20),
              textTheme: Theme.of(context).textTheme.copyWith(
                    caption: TextStyle(color: Colors.grey),
                  ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: ref.watch(
                  counterProvider), // Use ref.watch(counterProvider) to get the current state
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.book,
                    size: 24,
                  ),
                  label: 'Booking',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                    size: 24,
                  ),
                  label: 'Teams',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sports_cricket,
                    size: 24,
                  ),
                  label: 'Highlights',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.graphic_eq,
                    size: 24,
                  ),
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
      ),
    );
  }
}
