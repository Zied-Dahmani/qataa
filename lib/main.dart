import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qataa/config/router/app_router.dart';
import 'package:qataa/config/theme.dart';
import 'package:get/get.dart';
import 'package:qataa/application/app_bindings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qataa/config/locale.dart' as locale_dart;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'قاطع',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      theme: lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar')],
      translations: locale_dart.Locale(),
      locale: const Locale('ar'),
      getPages: AppRouter.routes,
    );
  }
}
