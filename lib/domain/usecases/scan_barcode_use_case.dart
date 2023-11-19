import 'package:qataa/data/repositories/barcode_repository.dart';
import 'package:qataa/domain/usecases/scan_barcode_use_case_interface.dart';

class ScanBarcodeUseCase implements IScanBarcodeUseCase {
  ScanBarcodeUseCase(this._barcodeRepository);

  final BarcodeRepository _barcodeRepository;

  @override
  Future<bool> execute(rawContent) async {
    return await _barcodeRepository.fetchBarcodeData(rawContent);
  }
}
