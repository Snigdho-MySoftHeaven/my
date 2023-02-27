import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/helper_functions.dart';

class floatingbutton extends StatelessWidget {
  const floatingbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.defaultDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'OK'.tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          title: 'Language',
          content: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Get.locale == Locale('bn') ? 'Bangla' : 'English',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Switch(
                        value: bn.value,
                        // This bool value toggles the switch.
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          if (value) {
                            Get.updateLocale(Locale('bn'));
                            bn.value = !bn.value;
                          } else {
                            Get.updateLocale(Locale('en'));
                            bn.value = !bn.value;
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      child: Icon(Icons.settings),
    );
  }
}
