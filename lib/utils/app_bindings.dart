import 'package:get/get.dart';
import 'package:qataa/application/controllers/scan_controller.dart';
import 'package:qataa/application/services/connectivity_service.dart';
import 'package:qataa/data/repositories/barcode_repository.dart';
import 'package:qataa/domain/usecases/scan_barcode_use_case.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectivityService(), fenix: true);
    Get.lazyPut(() => ScanController(ScanBarcodeUseCase(BarcodeRepository())), fenix: true);
  }
}
