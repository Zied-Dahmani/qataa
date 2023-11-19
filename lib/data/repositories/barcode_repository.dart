import 'package:qataa/data/sources/remote/barcode_data_source.dart';
import 'package:qataa/domain/repositories/barcode_repository_interface.dart';

class BarcodeRepository implements IBarcodeRepository {
  final BarcodeDataSource _barcodeDataProvider = BarcodeDataSource();
  // TODO: fill the black list
  final List<String> _blacklist = [
    'coca',
    'coca-cola',
    'fanta',
    'sprite',
    'pepsi',
    'bull',
    'miranda',
    'nestlé',
    'lipton',
    'nutella',
    'kitkat',
    'twix',
    'kat',
    'nesquik',
    'carrefour',
    'tang',
    'milka',
    'oreo',
    'bounty',
    'snickers',
    'mars',
    'galaxy',
    "m&m's",
    'danone'
    'nescafé',
    'knorr',
    'flakes',
    'ariel',
    'gillette',
    'rexona',
    'axe',
    "l'oreal",
    'pringles',
    'doritos',
    'cheetos',
    "lay's",
    'signal',
    'sensodyne',
    'oral-b',
    'colgate',
    'crest',
    'sunsilk',
    'nivea',
    'pantene',
    'lux',
    'dove',
    'vansih',
    'always',
    'dettol',
    'schwarzkopf',
    'palmolive',
    'fairy',
    'pril',
    'persil',
    'tide',
    'omo',
    'shoulders',
    'finish',
    'vaseline',
    'unilever',
    "johnson's",
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
