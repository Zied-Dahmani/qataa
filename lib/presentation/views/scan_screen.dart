import 'package:flutter/material.dart';
import 'package:qataa/application/controllers/scan_controller.dart';
import 'package:qataa/application/controllers/verification_state.dart';
import 'package:qataa/utils/constants/sizes.dart';
import 'package:qataa/utils/screen_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// TODO: Test(fontSize) & Logo & Play Store
// TODO: Intro & Share

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with WidgetsBindingObserver {
  final ScanController _scanController = Get.find();

  @override
  void initState() {
    super.initState();
    ScreenUtil.CustomSystemChrome(context);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scanController.listenVerificationState(context);
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
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
