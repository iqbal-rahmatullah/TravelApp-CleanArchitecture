import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_clean_architecture/common/app_route.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/usecases/get_all_destinations_case.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/bloc/all_destination/all_destination_bloc.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/bloc/search_destination/search_destination_bloc.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/bloc/top_destination/top_destination_bloc.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/cubit/dashboard_cubit.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/pages/dashboard.dart';
import 'package:travel_app_clean_architecture/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DashboardCubit(),
        ),
        BlocProvider(
          create: (_) => locator<AllDestinationBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<TopDestinationBloc>(),
        ),
        BlocProvider(
          create: (_) => locator<SearchDestinationBloc>(),
        ),
      ],
      child: MaterialApp(
        home: Dashboard(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor: Colors.white),
        initialRoute: AppRoute.dashboard,
        onGenerateRoute: AppRoute.onGenarateRoute,
      ),
    );
  }
}
