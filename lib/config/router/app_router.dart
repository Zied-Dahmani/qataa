import 'package:get/get.dart';
import 'package:qataa/presentation/views/scan_screen.dart';
import 'routes.dart';

class AppRouter {
  static List<GetPage> routes = [
    GetPage(name: Routes.scan, page: () => const ScanScreen()),
  ];
}
