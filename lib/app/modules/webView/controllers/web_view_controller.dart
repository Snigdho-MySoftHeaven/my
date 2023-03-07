import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class WebViewController extends GetxController {
  //TODO: Implement WebViewController
  final url = (Get.arguments as String).obs;
  InAppWebViewController? webViewController;

  @override
  Future<void> onInit() async {
    url.value = await Get.arguments as String;
    print(url);
    super.onInit();
  }

  void loadUrl(String url) {
    this.url.value = url;
  }

  void onWebViewCreated(InAppWebViewController controller) {
    webViewController = controller;
  }

  void onPageStarted(String url) {
    EasyLoading.showProgress(0, status: 'Loading...');
  }

  void onPageFinished(
    String url,
    InAppWebViewController controller,
  ) {
    Future.delayed(Duration(milliseconds: 600), () {
      EasyLoading.dismiss();
    });
  }

  Future<void> loadDocument(String url) async {
    final response = await http.get(Uri.parse(url));
    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/result.pdf");
    await file.writeAsBytes(response.bodyBytes);
    await OpenFilex.open(file.path);
  }
}
