import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImplementation implements NetworkInfo {
  final Connectivity connect;

  NetworkInfoImplementation(this.connect);

  @override
  Future<bool> isConnected() async {
    final connectivityResult = connect.checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
