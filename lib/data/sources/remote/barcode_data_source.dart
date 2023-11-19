import 'package:dio/dio.dart';
import 'package:qataa/utils/constants/api_constants.dart';

class BarcodeDataSource {
  final dio = Dio()
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 10);

  Future<Response> fetchBarcodeData(String barcode) async {
      return await dio.get(
        kBarcodeEndpoint,
        queryParameters: {'query': barcode},
        options: Options(
          headers: {
            'X-RapidAPI-Key': kXRapidAPIKey,
            'X-RapidAPI-Host': kXRapidAPIHost,
          },
          validateStatus: (status) {
            return status == 200;
          },
        ),
      );
    }
}
