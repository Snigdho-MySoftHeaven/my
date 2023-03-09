import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/qrcoode_controller.dart';

class QrcoodeView extends GetView<QrcoodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff348739),
        title: Text("দাখিলা".tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            errorOrSuccessView(controller: controller),
            qrCodeScanView(
              controller: controller,
            ),
            buttonView(controller: controller),
          ],
        ),
      ),
    );
  }
}

class buttonView extends StatelessWidget {
  const buttonView({
    super.key,
    required this.controller,
  });

  final QrcoodeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.result.value != null
        ? Center(
            child: ElevatedButton(
              onPressed: () {
                controller.qrcontroller?.resumeCamera();
                controller.result.value = null;
              },
              child: Text(
                'Scan Again',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        : Container());
  }
}

class qrCodeScanView extends StatelessWidget {
  const qrCodeScanView({
    super.key,
    required this.controller,
  });

  final QrcoodeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Get.width * .08),
      height: Get.height * .5,
      child: QRView(
        key: controller.qrKey,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: (MediaQuery.of(context).size.width < 400 ||
                    MediaQuery.of(context).size.height < 400)
                ? 150.0
                : 300.0),
        onQRViewCreated: controller.onQRViewCreated,
      ),
    );
  }
}

class errorOrSuccessView extends StatelessWidget {
  const errorOrSuccessView({
    super.key,
    required this.controller,
  });

  final QrcoodeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.result.value != null
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    controller.errormsg.value,
                    style: TextStyle(
                        color:
                            controller.error.value ? Colors.red : Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${controller.result.value!.code}',
                    style: TextStyle(
                        color:
                            controller.error.value ? Colors.red : Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
