import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../controllers/web_view_controller.dart';

class WebViewView extends GetView<WebViewController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text(
                controller.url.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              )),
          body: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(controller.url.value)),
            initialOptions: InAppWebViewGroupOptions(
              android: AndroidInAppWebViewOptions(
                disabledActionModeMenuItems:
                    AndroidActionModeMenuItem.MENU_ITEM_PROCESS_TEXT,
              ),
              crossPlatform: InAppWebViewOptions(
                disableContextMenu: true,
                preferredContentMode: UserPreferredContentMode.MOBILE,
                javaScriptEnabled: false,
                useOnDownloadStart: true,
              ),
            ),
            onWebViewCreated: controller.onWebViewCreated,
            onLoadStart: (controller, url) =>
                this.controller.onPageStarted(url.toString()),
            onLoadStop: (controller, url) async {
              this.controller.onPageFinished(url.toString(), controller);
            },
            onLoadError:
                (controller, Uri? url, int code, String message) async {
              await EasyLoading.showError('Error');
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) async {
              if (progress == 100) {
                await EasyLoading.showSuccess('Loaded');
              } else {
                await EasyLoading.showProgress(progress / 100,
                    status: 'Loading...');
              }
            },
          ),
        ));
  }
}
