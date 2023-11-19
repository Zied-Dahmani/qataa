import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qataa/utils/constants/sizes.dart';

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Get.theme.colorScheme.background,
        title: Text('alertTitle'.tr, style: Get.textTheme.headlineLarge),
        content: Text('alertSubtitle'.tr, style: Get.textTheme.bodyLarge),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kRadius),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('ok'.tr, style: Get.textTheme.bodyMedium!.copyWith(color: Get.theme.colorScheme.onPrimary),
            ),
          ),
        ],
      );
    },
  );
}
