import 'package:get/get.dart';
import 'package:qataa/presentation/widgets/onboarding.dart';
import 'routes.dart';

class AppRouter {
  static List<GetPage> routes = [
    GetPage(name: Routes.scan, page: () => onBoardingWidget()),
  ];
}
