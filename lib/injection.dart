import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_clean_architecture/core/platform/network_info.dart';
import 'package:travel_app_clean_architecture/features/destination/data/datasource/destination_local_datasource.dart';
import 'package:travel_app_clean_architecture/features/destination/data/datasource/destination_remote_datasource.dart';
import 'package:travel_app_clean_architecture/features/destination/data/repositories/destination_repository.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/repositories/destination_repositories.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/usecases/get_all_destinations_case.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/usecases/get_top_destination_case.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/usecases/search_destination_case.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/bloc/all_destination/all_destination_bloc.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/bloc/search_destination/search_destination_bloc.dart';
import 'package:travel_app_clean_architecture/features/destination/presentation/bloc/top_destination/top_destination_bloc.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  //bloc
  locator.registerFactory(() => AllDestinationBloc(locator()));
  locator.registerFactory(() => TopDestinationBloc(locator()));
  locator.registerFactory(() => SearchDestinationBloc(locator()));

  //usecase
  locator.registerLazySingleton(() => GetAllDestinationCase(locator()));
  locator.registerLazySingleton(() => GetTopDestinationCase(locator()));
  locator.registerLazySingleton(() => SearchDestinationCase(locator()));

  //repository
  locator.registerLazySingleton<DestinationRepository>(
      () => DestinationRepositoryImpl(
            remoteDataSource: locator(),
            localDataSource: locator(),
            networkInfo: locator(),
          ));

  //data
  locator.registerLazySingleton<DestinationLocalDataSource>(
      () => DestinationLocalDataSourceImplementation(locator()));
  locator.registerLazySingleton<DestinationRemoteDataSource>(
      () => DestinationRemoteDataSourceImplementation(locator()));

  //platform
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(locator()));

  //external
  final pref = SharedPreferences.getInstance();
  locator.registerLazySingleton(() => pref);
  locator.registerLazySingleton(() => http.Client);
  locator.registerLazySingleton(() => Connectivity());
}
