import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../custom_widget/floatingButton.dart';
import '../controllers/qrcoode_controller.dart';

class QrcoodeView extends GetView<QrcoodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff348739),
        title: Text('Qr Code'.tr),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: floatingbutton(),
      body: Center(
        child: Column(
          children: [
            Container(
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
            ),
            Obx(() => controller.result.value != null
                ? Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.qrcontroller?.resumeCamera();
                      },
                      child: Text(
                        'Scan Again',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                : Container()),
          ],
        ),
      ),
    );
  }
}
