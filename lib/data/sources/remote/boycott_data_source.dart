import 'package:dio/dio.dart';
import 'package:qataa/utils/constants/api_constants.dart';

class BoycottDataSource {
  final dio = Dio()
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 10);

  Future<Response> fetchBoycottList() async {
    return await dio.get(
      kBoycottListEndpoint,
      options: Options(
        validateStatus: (status) {
          return status == 200;
        },
      ),
    );
  }
}
