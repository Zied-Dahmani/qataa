import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qataa/utils/constants/sizes.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key, this.isBoycotted,this.title, this.errorMessage});

  final isBoycotted, title, errorMessage;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(kBigSpace),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kRadius),
            topRight: Radius.circular(kRadius),
          ),
        ),
        //height: kBottomSheetHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                  isBoycotted == null
                      ? 'assets/images/error.gif'
                      : isBoycotted
                          ? 'assets/images/boycotted.gif'
                          : 'assets/images/supported.gif',
                  height: kBottomSheetIconSize,
                  width: kBottomSheetIconSize),
              Text(
                  isBoycotted == null
                      ? title
                      : isBoycotted
                          ? 'boycottedTitle'.tr
                          : 'supportedTitle'.tr,
                  style: Get.textTheme.headlineLarge),
              Text(
                isBoycotted == null
                    ? errorMessage
                    : isBoycotted
                        ? 'boycottSubtitle'.tr
                        : 'supportedSubtitle'.tr,
                style: Get.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
