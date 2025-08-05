import 'package:flutter/material.dart';
import 'package:fundraising/features/announcements/presentation/pages/announcement_page.dart';
import 'package:fundraising/features/auth/presentation/pages/Login_page.dart';
import 'package:fundraising/features/auth/presentation/pages/signup_page.dart';
import 'package:fundraising/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:fundraising/features/leaderboard/presentation/pages/leaderboard_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case '/leaderboard':
        return MaterialPageRoute(builder: (_) => const LeaderboardPage());
      case '/announcements':
        return MaterialPageRoute(builder: (_) => const AnnouncementsPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      );
    });
  }
}
