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
        padding: const EdgeInsets.all(Sizes.kBigSpace),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Sizes.kRadius),
            topRight: Radius.circular(Sizes.kRadius),
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
                  height: Sizes.kBottomSheetIconSize,
                  width: Sizes.kBottomSheetIconSize),
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
                        ? 'boycottedSubtitle'.tr
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
