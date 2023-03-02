import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Utils/helper_functions.dart';

class floatingbutton extends StatelessWidget {
  const floatingbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xff348739),
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
                        Get.locale == Locale('bn') ? 'Bangla'.tr : 'English'.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Switch(
                        value: bn.value,
                        // This bool value toggles the switch.
                        activeColor: Colors.red,
                        onChanged: (bool value) async {
                          if (value) {
                            Get.updateLocale(Locale('bn'));
                            await GetStorage().write('language', 'bn');
                            bn.value = !bn.value;
                          } else {
                            Get.updateLocale(Locale('en'));
                            await GetStorage().write('language', 'en');
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
