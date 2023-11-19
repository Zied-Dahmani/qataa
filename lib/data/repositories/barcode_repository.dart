import 'package:qataa/data/sources/remote/barcode_data_source.dart';
import 'package:qataa/domain/repositories/barcode_repository_interface.dart';

class BarcodeRepository implements IBarcodeRepository {
  final BarcodeDataSource _barcodeDataProvider = BarcodeDataSource();
  // TODO: fill the black list
  final List<String> _blacklist = [
    'danone'
    'nescafé',
    'coca',
    'ariel',
    'gillette',
    'rexona',
    'axe',
    "l'oreal",
    'pringles',
    'doritos',
    "lay's",
    'signal',
    'colgate'
  ];

  @override
  Future<bool> fetchBarcodeData(String barcode) async {
      final result = await _barcodeDataProvider.fetchBarcodeData(barcode);
      return ['brand', 'desciption','manufacturer','title'].any((attribute) {
        final attributeValue = result.data['product'][attribute];
        if (attributeValue != null) {
          final lowerCasedValue = attributeValue.toLowerCase();
          final words = lowerCasedValue.split(' ');
          return words.any((word) => _blacklist.contains(word));
        }
        return false;
      });
  }

}
