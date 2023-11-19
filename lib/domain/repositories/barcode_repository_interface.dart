abstract class IBarcodeRepository {
  Future<bool> fetchBarcodeData(String barcode);
}