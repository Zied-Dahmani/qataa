import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService extends GetxService {
  var isConnected = false.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivityStreamSubscription;

  @override
  void onInit() {
    super.onInit();
    listenConnectivity();
  }

  void listenConnectivity() {
    connectivityStreamSubscription = _connectivity.onConnectivityChanged.listen((connectivityResult) {
      isConnected.value = connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile;
    });
  }

  @override
  void onClose() {
    connectivityStreamSubscription.cancel();
    super.onClose();
  }
}
