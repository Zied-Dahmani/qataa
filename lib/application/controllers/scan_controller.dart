// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:qataa/application/controllers/verification_state.dart';
import 'package:qataa/application/services/connectivity_service.dart';
import 'package:qataa/application/usecases/scan_barcode_use_case.dart';
import 'package:qataa/presentation/widgets/bottom_sheet_content.dart';
import 'package:qataa/utils/screen_util.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:developer' as developer;
import 'package:url_launcher/url_launcher.dart';

class ScanController extends GetxController {
  ScanController(this._scanBarcodeUseCase);
  final ScanBarcodeUseCase _scanBarcodeUseCase;

  final ConnectivityService _connectivityService = Get.find();
  final _verificationState = VerificationState().obs;
  RxInterface<VerificationState> get rxIState => _verificationState;
  VerificationState get state => _verificationState.value;
  bool get isBoycotted {
    VerificationLoadSuccess verificationLoadSuccess = _verificationState.value as VerificationLoadSuccess;
    return verificationLoadSuccess.isBoycotted;
  }

  static final _possibleFormats = BarcodeFormat.values.toList()..removeWhere((e) => e == BarcodeFormat.unknown);
  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  Future<void> scanBarcode(BuildContext context) async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          restrictFormat: selectedFormats,
          useCamera: -1,
          autoEnableFlash: false,
          android: const AndroidOptions(
            aspectTolerance: 0.00,
            useAutoFocus: true,
          ),
        ),
      );
      ScreenUtil.CustomSystemChrome(context);
      if (result.rawContent.isNotEmpty) {
        _verificationState.value = VerificationLoadInProgress();
        final isBoycotted = await _scanBarcodeUseCase.execute(result.rawContent);
        _verificationState.value = VerificationLoadSuccess(isBoycotted: isBoycotted);
      }
    } catch (e) {
      developer.log(e.toString(), name: 'Catch scanBarcode');
      if (e is! PlatformException) {
        _verificationState.value = VerificationLoadFailure(error: e.toString());
      }
    }
  }

  void listenVerificationState(BuildContext context) {
    ever<VerificationState>(rxIState, (VerificationState value) async {
      if (value is VerificationLoadFailure) {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BottomSheetContent(
                title : _connectivityService.isConnected.value ?'productNotKnownTitle'.tr: 'connectivityProblemTitle'.tr,
                errorMessage: _connectivityService.isConnected.value
                    ? 'productNotKnownSubtitle'.tr
                    : 'connectivityProblemSubtitle'.tr);
          },
        );
      } else if (value is VerificationLoadSuccess) {
        final player1 = AudioPlayer();
        final player2 = AudioPlayer();

        if (isBoycotted) {
          player2.play(AssetSource('sounds/baby_crying.mp3'));
          player1.setVolume(0.3);
          player1.play(AssetSource('sounds/explosion.mp3'));
          player1.onPlayerComplete.listen((event) {
            player1.seek(Duration.zero);
            player1.play(AssetSource('sounds/explosion.mp3'));
          });
        }

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return BottomSheetContent(isBoycotted: isBoycotted);
          },
        ).whenComplete(() {
          if (isBoycotted) {
            player1.stop();
            player2.stop();
          }
        });
      }
    });
  }

  void sendEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'contact.rebounddev@gmail.com',
      queryParameters: {'subject': 'قاطع'},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  Future<void> shareApp() async {
    await Share.shareUri(Uri.parse('https://play.google.com/store/apps/details?id=com.rebounddev.qataa'));
  }
}
