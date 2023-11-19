import 'package:flutter/material.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';
import 'package:qataa/application/controllers/scan_controller.dart';
import 'package:qataa/application/controllers/verification_state.dart';
import 'package:qataa/application/services/onboarding_service.dart';
import 'package:qataa/utils/constants/sizes.dart';
import 'package:qataa/utils/screen_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// TODO: Test(small devices) & Play Store ( Logo & Name )

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key,required this.focusNodes});
  final focusNodes;

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with WidgetsBindingObserver {
  final ScanController _scanController = Get.find();
  final OnBoardingService _onBoardingService = Get.find();

  @override
  void initState() {
    super.initState();
    ScreenUtil.CustomSystemChrome(context);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _scanController.listenVerificationState(context);
      if(await _onBoardingService.isFirstTime())
        {
          Onboarding.of(context)!.show();
        }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ScreenUtil.CustomSystemChrome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: Focus(
          focusNode: widget.focusNodes[1],
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.solidEnvelope),
            onPressed: () {
              _scanController.sendEmail();
            },
          ),
        ),
      ),
      body: GetX<ScanController>(builder: (_) {
        if (_scanController.state is VerificationLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kBigSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/basket.gif",
                  height: ScreenUtil.getScreenHeight(context) / 3,
                  width: ScreenUtil.getScreenWidth(context),
                ),
                Text('scanTitle'.tr, style: Get.textTheme.headlineMedium),
                Text(
                  'scanSubtitle'.tr,
                  style: Get.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
      }),
      floatingActionButton: Focus(
        focusNode: widget.focusNodes[0],
        child: FloatingActionButton(
          child: Padding(
            padding: const EdgeInsets.only(top: kSmallSpace),
            child: Image.asset(
              "assets/images/barcode.png",
              width: kIconSize,
              height: kIconSize,
            ),
          ),
          onPressed: () {
            _scanController.scanBarcode(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
}
