import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';
import 'package:qataa/presentation/views/scan_screen.dart';

Widget onBoardingWidget() {
  final GlobalKey<OnboardingState> onBoardingKey = GlobalKey<OnboardingState>();
  final focusNodes = List<FocusNode>.generate(
    2,
    (int i) => FocusNode(debugLabel: 'OnBoarding Focus Node $i'),
    growable: false,
  );

  return Onboarding(
    key: onBoardingKey,
    autoSizeTexts: true,
    debugBoundaries: false,
    steps: <OnboardingStep>[
      OnboardingStep(
        focusNode: focusNodes[0],
        titleText: 'scanOnBoardingTitle'.tr,
        bodyText: 'scanOnBoardingBody'.tr,
        titleTextStyle: Get.textTheme.headlineMedium,
        bodyTextStyle: Get.textTheme.bodyMedium!.copyWith(color: Get.theme.colorScheme.onPrimary),
        fullscreen: false,
        showPulseAnimation: true,
        shape: const CircleBorder(),
        overlayColor: Get.theme.colorScheme.primary.withOpacity(0.9),
        overlayShape: const CircleBorder(),
      ),
      OnboardingStep(
        focusNode: focusNodes[1],
        titleText: 'emailOnBoardingTitle'.tr,
        bodyText: 'emailOnBoardingBody'.tr,
        titleTextStyle: Get.textTheme.headlineMedium,
        bodyTextStyle: Get.textTheme.bodyMedium!.copyWith(color: Get.theme.colorScheme.onPrimary),
        fullscreen: false,
        showPulseAnimation: true,
        shape: const CircleBorder(),
        overlayColor: Get.theme.colorScheme.primary.withOpacity(0.9),
        overlayShape: const CircleBorder(),
      ),
    ],
    child: ScanScreen(focusNodes: focusNodes),
  );
}
