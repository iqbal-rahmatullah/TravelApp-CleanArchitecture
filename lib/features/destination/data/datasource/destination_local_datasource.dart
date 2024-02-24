import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_clean_architecture/core/error/exception.dart';
import 'package:travel_app_clean_architecture/features/destination/data/model/destination_model.dart';

abstract class DestinationLocalDataSource {
  Future<List<DestinationModel>> all();
  Future<bool> cache(List<DestinationModel> destinations);
}

const DestinationKey = "all_destinations";

class DestinationLocalDataSourceImplementation
    implements DestinationLocalDataSource {
  final SharedPreferences prev;

  DestinationLocalDataSourceImplementation(this.prev);

  @override
  Future<List<DestinationModel>> all() async {
    String? destinations = prev.getString(DestinationKey);
    if (destinations != null) {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(jsonDecode(destinations));

      return list.map((e) => DestinationModel.fromJson(e)).toList();
    }
    throw CacheException();
  }

  @override
  Future<bool> cache(List<DestinationModel> destinations) async {
    List<Map<String, dynamic>> list =
        destinations.map((e) => e.toJson()).toList();
    String value = jsonEncode(list);
    return prev.setString(DestinationKey, value);
  }
}
