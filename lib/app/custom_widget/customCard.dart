import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      onTap: () => onTap(),
      child: Card(
        child: SizedBox(
          height: 180.h,
          width: 146.w,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(
                  "assets/images/icon_all_seba.png",
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.all(10.r),
                child: Text(text.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              ),
              Spacer(),
              Container(
                  height: 35.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Color(0xff92D45E),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4.r),
                          bottomRight: Radius.circular(4.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 15.sp,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
