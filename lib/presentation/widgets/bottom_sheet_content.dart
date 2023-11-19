import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qataa/utils/constants/sizes.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key, this.isBlacklisted, this.errorMessage});

  final isBlacklisted, errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kBigSpace),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kRadius),
          topRight: Radius.circular(kRadius),
        ),
      ),
      height: kBottomSheetHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
                isBlacklisted == null
                    ? 'assets/images/error.gif'
                    : isBlacklisted
                        ? 'assets/images/blacklisted.gif'
                        : 'assets/images/not_blacklisted.gif',
                height: kBottomSheetIconSize,
                width: kBottomSheetIconSize),
            Text(
                isBlacklisted == null
                    ? 'problemTitle'.tr
                    : isBlacklisted
                        ? 'blacklistedTitle'.tr
                        : 'notBlacklistedTitle'.tr,
                style: Get.textTheme.headlineMedium),
            Text(
              isBlacklisted == null
                  ? errorMessage
                  : isBlacklisted
                      ? 'blacklistSubtitle'.tr
                      : 'notBlacklistSubtitle'.tr,
              style: Get.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
