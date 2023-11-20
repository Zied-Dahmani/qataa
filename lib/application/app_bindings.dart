import 'package:get/get.dart';
import 'package:qataa/application/controllers/scan_controller.dart';
import 'package:qataa/application/services/connectivity_service.dart';
import 'package:qataa/application/services/onboarding_service.dart';
import 'package:qataa/application/usecases/scan_barcode_use_case.dart';
import 'package:qataa/data/repositories/barcode_repository.dart';
import 'package:qataa/data/sources/remote/barcode_data_source.dart';
import 'package:qataa/data/sources/remote/boycott_data_source.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectivityService(), fenix: true);
    Get.lazyPut(() => OnBoardingService(), fenix: true);
    Get.lazyPut(() => ScanController(ScanBarcodeUseCase(BarcodeRepository(BarcodeDataSource(),BoycottDataSource()))), fenix: true);
  }
}
