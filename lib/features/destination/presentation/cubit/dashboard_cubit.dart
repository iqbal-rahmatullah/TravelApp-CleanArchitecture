import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/pages/home.dart';

class DashboardCubit extends Cubit<int> {
  DashboardCubit() : super(0);

  change(int i) => emit(i);
  final List menuDashboard = [
    ['Homepage', Icons.home, const HomePage()],
    [
      'Near',
      Icons.near_me,
      const Center(
        child: Text("Near"),
      )
    ],
    [
      'Favorite',
      Icons.favorite,
      const Center(
        child: Text("Favorite"),
      )
    ],
    [
      'Profile',
      Icons.person,
      const Center(
        child: Text("Profile"),
      )
    ],
  ];

  Widget get page => menuDashboard[state][2];
}
