import 'package:qataa/data/sources/remote/barcode_data_source.dart';
import 'package:qataa/data/sources/remote/boycott_data_source.dart';
import 'package:qataa/domain/repositories/barcode_repository_interface.dart';

class BarcodeRepository implements IBarcodeRepository {
  BarcodeRepository(this._barcodeDataProvider, this._boycottDataSource);

  final BarcodeDataSource _barcodeDataProvider;
  final BoycottDataSource _boycottDataSource;

  @override
  Future<bool> fetchBarcodeData(String barcode) async {
      final boycottList = await _boycottDataSource.fetchBoycottList();
      final result = await _barcodeDataProvider.fetchBarcodeData(barcode);

      return ['brand', 'desciption','manufacturer','title'].any((attribute) {
        final attributeValue = result.data['product'][attribute];
        if (attributeValue != null) {
          final lowerCasedValue = attributeValue.toLowerCase();
          return boycottList.data.any((word) => lowerCasedValue.contains(word));
        }
        return false;
      });
  }

}
