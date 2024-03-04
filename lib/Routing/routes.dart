import 'package:flutter/material.dart';
import 'package:sportifan_user/screens/main/bookings.dart';
import 'package:sportifan_user/screens/main/highlights.dart';
import 'package:sportifan_user/screens/main/stats.dart';
import 'package:sportifan_user/screens/main/your_teams.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BookingView());
      case '/teams':
        return MaterialPageRoute(builder: (_) => YourTeams());
      case '/highlights':
        return MaterialPageRoute(
            builder: (_) => HighlightsView(
                  highlightsExists: true,
                ));
      case '/stats':
        return MaterialPageRoute(
            builder: (_) => StatsView(
                  statsExists: true,
                ));
      default:
        return MaterialPageRoute(builder: (_) => BookingView());
    }
  }
}
