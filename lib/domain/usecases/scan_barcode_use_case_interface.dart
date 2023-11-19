abstract class IScanBarcodeUseCase {
  Future<bool> execute(String rawContent);
}