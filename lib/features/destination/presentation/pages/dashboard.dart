import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/cubit/dashboard_cubit.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<DashboardCubit>().page,
        bottomNavigationBar: Material(
          elevation: 10,
          child: BlocBuilder<DashboardCubit, int>(
            builder: (context, state) => Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: NavigationBar(
                selectedIndex: state,
                onDestinationSelected: (value) =>
                    context.read<DashboardCubit>().change(value),
                backgroundColor: Colors.white,
                surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                destinations: context
                    .read<DashboardCubit>()
                    .menuDashboard
                    .map((e) => NavigationDestination(
                          icon: Icon(
                            e[1],
                            color: Colors.grey,
                          ),
                          label: e[0],
                          tooltip: e[0],
                          selectedIcon: Icon(
                            e[1],
                            color: Theme.of(context).primaryColor,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ));
  }
}
