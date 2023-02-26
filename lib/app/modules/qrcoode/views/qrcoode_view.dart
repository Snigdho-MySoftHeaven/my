import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/qrcoode_controller.dart';

class QrcoodeView extends GetView<QrcoodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QrcoodeView'),
        centerTitle: true,
      ),
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
            Expanded(
              flex: 2,
              child: Center(
                child: Obx(
                  () => (controller.result.value != null)
                      ? Text(
                          'Barcode Type: ${describeEnum(controller.result.value!.format)}   Data: ${controller.result.value!.code}')
                      : Container(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
