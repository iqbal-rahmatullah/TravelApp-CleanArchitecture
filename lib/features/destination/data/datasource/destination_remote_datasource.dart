import 'dart:convert';

import 'package:travel_app_clean_architecture/api/utils.dart';
import 'package:travel_app_clean_architecture/core/error/exception.dart';
import 'package:travel_app_clean_architecture/features/destination/data/model/destination_model.dart';
import 'package:http/http.dart' as http;

abstract class DestinationRemoteDataSource {
  Future<List<DestinationModel>> all();
  Future<List<DestinationModel>> top();
  Future<List<DestinationModel>> search(String query);
}

class DestinationRemoteDataSourceImplementation
    implements DestinationRemoteDataSource {
  final http.Client client;

  DestinationRemoteDataSourceImplementation(this.client);

  @override
  Future<List<DestinationModel>> all() async {
    Uri url = Uri.parse("${apiData.baseUrl}");
    final response = await client.get(url).timeout(Duration(seconds: 3));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> list = jsonDecode(response.body);
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> search(String query) async {
    Uri url = Uri.parse("${apiData.baseUrl}/query");
    final response = await client.get(url).timeout(Duration(seconds: 3));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> list = jsonDecode(response.body);
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> top() async {
    Uri url = Uri.parse("${apiData.baseUrl}/top");
    final response = await client.get(url).timeout(Duration(seconds: 3));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> list = jsonDecode(response.body);
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}
