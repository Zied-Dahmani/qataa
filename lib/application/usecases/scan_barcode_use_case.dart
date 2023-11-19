import 'package:qataa/application/usecases/scan_barcode_use_case_interface.dart';
import 'package:qataa/data/repositories/barcode_repository.dart';

class ScanBarcodeUseCase implements IScanBarcodeUseCase {
  ScanBarcodeUseCase(this._barcodeRepository);

  final BarcodeRepository _barcodeRepository;

  @override
  Future<bool> execute(rawContent) async {
    return await _barcodeRepository.fetchBarcodeData(rawContent);
  }
}
