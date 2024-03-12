import 'package:flutter/material.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/pages/dashboard.dart';

class AppRoute {
  static const dashboard = '/';
  static const detailDestination = '/destination/detail';
  static const searchDestination = '/destination/search';

  static Route<dynamic>? onGenarateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      default:
        return _notFoundPage;
    }
  }

  static MaterialPageRoute get _notFoundPage => MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: const Text('Page Not Found'),
          ),
        ),
      );
}
