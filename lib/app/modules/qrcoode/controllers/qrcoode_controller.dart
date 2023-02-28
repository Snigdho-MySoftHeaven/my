import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrcoodeController extends GetxController {
  //TODO: Implement QrcoodeController
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Rx<Barcode?> result = Rx<Barcode?>(null);
  QRViewController? qrcontroller;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> permission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();

// You can can also directly ask the permission about its status.
      if (await Permission.location.isRestricted) {
        Get.dialog(
          CupertinoAlertDialog(
            title: Text('Permission Required'),
            content: Text('Please allow camera permission'),
            actions: [
              CupertinoDialogAction(
                child: Text('Ok'),
                onPressed: () async {
                  await Permission.camera.request();
                  Get.back();
                },
              ),
              CupertinoDialogAction(
                child: Text('Cancel'),
                onPressed: () async {
                  Get.back();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void onClose() {
    qrcontroller!.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    qrcontroller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code!.isNotEmpty) {
        qrcontroller?.pauseCamera();
        if (scanData.code!.contains('http')) {
          result.value = scanData;
          print(result.value!.code);
          Get.toNamed(
            '/web-view',
            arguments: result.value!.code,
          );
        } else {
          qrcontroller?.resumeCamera();
          result.value = null;
          Get.snackbar('Invalid QR Code', 'Please scan a valid QR Code');
        }
      }
      update();
    });
  }
}
