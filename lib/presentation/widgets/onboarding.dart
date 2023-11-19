import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';
import 'package:qataa/presentation/views/scan_screen.dart';

Widget onBoardingWidget() {
  final GlobalKey<OnboardingState> onBoardingKey = GlobalKey<OnboardingState>();
  final focusNodes = List<FocusNode>.generate(
    1,
    (int i) => FocusNode(debugLabel: 'OnBoarding Focus Node $i'),
    growable: false,
  );
  late void Function() setVisible;

  return Onboarding(
    key: onBoardingKey,
    autoSizeTexts: true,
    debugBoundaries: false,
    onChanged: (int index) {
      if (index == 0) {
        setVisible.call();
      }
    },
    steps: <OnboardingStep>[
      OnboardingStep(
        focusNode: focusNodes[0],
        titleText: 'scanOnBoardingTitle'.tr,
        bodyText: 'scanOnBoardingBody'.tr,
        titleTextStyle: Get.textTheme.headlineLarge,
        bodyTextStyle: Get.textTheme.bodyLarge!
            .copyWith(color: Get.theme.colorScheme.onPrimary),
        textAlign: TextAlign.center,
        fullscreen: false,
        showPulseAnimation: true,
        shape: const CircleBorder(),
        overlayColor: Get.theme.colorScheme.primary.withOpacity(.9),
        overlayShape: const CircleBorder(),
        overlayBehavior: HitTestBehavior.translucent,
      ),
      /*OnboardingStep(
        focusNode: focusNodes[1],
        titleText: 'emailOnBoardingTitle'.tr,
        bodyText: 'emailOnBoardingBody'.tr,
        titleTextStyle: Get.textTheme.headlineLarge,
        bodyTextStyle: Get.textTheme.bodyLarge!
            .copyWith(color: Get.theme.colorScheme.onPrimary),
        textAlign: TextAlign.center,
        overlayColor: Get.theme.colorScheme.primary.withOpacity(.9),
        shape: const CircleBorder(),
        overlayShape: const CircleBorder(),
      ),*/
    ],
    child: ScanScreen(
      focusNodes: focusNodes,
      builder: (BuildContext context, void Function() methodFromChild) {
        setVisible = methodFromChild;
      },
    ),
  );
}
