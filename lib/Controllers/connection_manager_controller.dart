import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Routes/route_helper.dart';
import '../Utils/snackbar.dart';

class ConnectionManager {
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  static var connectionType = ConnectivityResult.none;

  static final Connectivity _connectivity = Connectivity();

  static StreamSubscription? _streamSubscription;

  static void init() {
    // getConnectivityType();
    if (_streamSubscription != null) return;
    getConnectivityType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
  }

  static Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await _connectivity.checkConnectivity();
      if (kDebugMode) print("getConnectivityType");
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  static _updateState(ConnectivityResult result) {
    if (kDebugMode) print("_updateState");

    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = ConnectivityResult.wifi;
        GetStorage().hasData("token")
            ? Get.offAllNamed(RouteHelper.dashboardScreen)
            : Get.offAllNamed(RouteHelper.introScreen);

        break;
      case ConnectivityResult.mobile:
        connectionType = ConnectivityResult.mobile;
        GetStorage().hasData("token")
            ? Get.offAllNamed(RouteHelper.dashboardScreen)
            : Get.offAllNamed(RouteHelper.introScreen);

        break;
      case ConnectivityResult.none:
        connectionType = ConnectivityResult.none;

        Get.offAllNamed(RouteHelper.noInternetConnection);
        break;
      default:
        SnackBarDisplay.show(message: "counld't check for connection");
        break;
    }
  }

  static dispose() {
    _streamSubscription?.cancel();
  }
}
