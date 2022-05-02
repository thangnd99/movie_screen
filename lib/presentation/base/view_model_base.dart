import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Status
enum Status {
  ///
  normal,

  ///
  loading,

  ///
  success,

  ///
  error
}

/// ViewModelBase
abstract class ViewModelBase extends GetxController implements IViewModelBase {
  /// subscription
  late StreamSubscription<ConnectivityResult> subscription;

  /// status
  final status = Status.normal.obs;

  /// onError
  final onError = Object().obs;

  /// scaffoldBackgroundColor
  final scaffoldBackgroundColor = Colors.white.obs;

  /// listenConnectivityStatus
  void listenConnectivityStatus() {
    subscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// cancelConnectivitySubscription
  void cancelConnectivitySubscription() {
    subscription.cancel();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        onConnected();
        break;
      case ConnectivityResult.mobile:
        onConnected();
        break;
      case ConnectivityResult.none:
        onDisconnect();
        break;
      case ConnectivityResult.bluetooth:
        onConnected();
        break;
      case ConnectivityResult.ethernet:
        onConnected();
        break;
    }
  }

  /// onInitView
  void onInitView() {}

  /// onDisposeView
  void onDisposeView() {}

  /// onConnected
  void onConnected() {}

  /// onDisconnect
  void onDisconnect() {}
}

/// IViewModelBase
mixin IViewModelBase {}
