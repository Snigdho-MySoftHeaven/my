import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customCardView extends StatelessWidget {
  final String text;
  final Function onTap;
  const customCardView({
    required this.text,
    required this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: SizedBox(
                height: 180,
                width: 146,
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Image.asset(
                      "images/icon_all_seba.png",
                      width: 60,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(text.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
          ),
          Container(
              height: 35,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color(0xffCDDC39),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Details",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 15,
                    color: Colors.white,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
