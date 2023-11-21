import 'package:flutter/material.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';
import 'package:qataa/application/controllers/scan_controller.dart';
import 'package:qataa/application/controllers/verification_state.dart';
import 'package:qataa/application/services/onboarding_service.dart';
import 'package:qataa/presentation/widgets/alert_dialog.dart';
import 'package:qataa/utils/constants/sizes.dart';
import 'package:qataa/utils/screen_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key, required this.focusNodes, this.builder});
  final focusNodes, builder;

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with WidgetsBindingObserver {
  final ScanController _scanController = Get.find();
  final OnBoardingService _onBoardingService = Get.find();
  bool isVisible = false;
  bool isFirstTime = false;

  @override
  void initState() {
    super.initState();
    ScreenUtil.CustomSystemChrome(context);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _scanController.listenVerificationState(context);
      widget.builder.call(context, setVisible);

      isFirstTime = await _onBoardingService.isFirstTime();
      if (isFirstTime) {
        Onboarding.of(context)!.show();
      } else {
        setVisible();
      }

    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ScreenUtil.CustomSystemChrome(context);
    }
  }

  void setVisible(){
    setState(() {
      isVisible = true;
    });
    if (isFirstTime) {
      showAlertDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.solidEnvelope),
            onPressed: () {
              _scanController.sendEmail();
            },
          ),
        ),
        body: GetX<ScanController>(builder: (_) {
          if (_scanController.state is VerificationLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.kBigSpace),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/basket.gif",
                    height: ScreenUtil.getScreenHeight(context) / 3,
                    width: ScreenUtil.getScreenWidth(context),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        Text('scanTitle'.tr, style: Get.textTheme.headlineLarge),
                        Text(
                          'scanSubtitle'.tr,
                          style: Get.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        }),
        floatingActionButton: Focus(
          focusNode: widget.focusNodes[0],
          child: FloatingActionButton(
            child: Padding(
              padding: const EdgeInsets.only(top: Sizes.kSmallSpace),
              child: Image.asset(
                "assets/images/barcode.png",
                width: Sizes.kIconSize,
                height: Sizes.kIconSize,
              ),
            ),
            onPressed: () {
              _scanController.scanBarcode(context);
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
