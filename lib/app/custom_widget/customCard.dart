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
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff92D45E),
            width: 1.sp,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        height: 165.w,
        width: 150.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 22.5.w, bottom: 5),
              child: Image.asset(
                "assets/images/icon_all_seba.png",
                width: 70,
                height: 60,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: 150.h,
                padding: EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                child: Text(text.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(right: 2.w, bottom: 2.w),
              height: 35.h,
              width: Get.width,
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: 20.h,
                      width: 21.w,
                      decoration: BoxDecoration(
                        color: Color(0xff92D45E),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(55.r),
                            bottomRight: Radius.circular(5.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 10.sp,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
