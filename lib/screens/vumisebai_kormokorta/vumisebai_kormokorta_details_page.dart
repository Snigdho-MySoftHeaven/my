import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../const/app_color.dart';
import '../../widgets/custom_textstyle.dart';

class VumiSebaiKormokortaDetails extends StatefulWidget {
  final List user;

  VumiSebaiKormokortaDetails({Key? key, required this.user}) : super(key: key);

  @override
  State<VumiSebaiKormokortaDetails> createState() =>
      _VumiSebaiKormokortaDetailsState();
}

class _VumiSebaiKormokortaDetailsState
    extends State<VumiSebaiKormokortaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBg,
      appBar: PreferredSize(
        preferredSize: Size.square(
          126.h,
        ),
        child: Container(
            padding: EdgeInsets.only(top: 25.h),
            alignment: Alignment.center,
            height: 126.h,
            decoration: BoxDecoration(
                color: AppColor.kDarkGreen,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r))),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColor.kWhite,
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "ভুমি সেবায় নিয়োজিত কর্মকর্তা".tr,
                  style:
                      customTextStyle(20.sp, AppColor.kWhite, FontWeight.w500),
                ),
              ],
            )),
      ),
      body: Container(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'পুনরায় খুঁজুন'.tr,
                  style: customTextStyle(
                      15.sp, AppColor.kDarkGreen, FontWeight.w400),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.user.length,
                itemBuilder: (context, index) {
                  final user = widget.user[index];
                  return Column(
                    children: [
                      if (user["office_users"].length != 0)
                        Container(
                          height: 55.h,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.w),
                                  topRight: Radius.circular(5.w)),
                              color: AppColor.kDarkGreen),
                          child: Center(
                              child: Text(
                            user["office_name"],
                            style: customTextStyle(
                                18.sp, AppColor.kWhite, FontWeight.w600),
                          )),
                        ),
                      for (int i = 0; i < user["office_users"].length; i++)
                        i == 0
                            ? SizedBox(
                                child: Card(
                                  margin: EdgeInsets.only(bottom: 5.w),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.h,
                                      bottom: 10.h,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 10.h,
                                            bottom: 10.h,
                                            left: 5.w,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(200.r),
                                            child: ClipRect(
                                              clipBehavior: Clip.antiAlias,
                                              child: Align(
                                                alignment: Alignment.center,
                                                widthFactor: .85,
                                                heightFactor: .85,
                                                child: CachedNetworkImage(
                                                  imageUrl: user['office_users']
                                                      [i]['photo'],
                                                  progressIndicatorBuilder:
                                                      (context, _, __) {
                                                    return Container(
                                                      child: Center(
                                                        heightFactor: 110,
                                                        widthFactor: 105,
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  },
                                                  height: 110,
                                                  width: 105,
                                                  fit: BoxFit.fill,
                                                  errorWidget:
                                                      (BuildContext context, _,
                                                          __) {
                                                    print(user['office_users']
                                                        [i]['photo']);
                                                    return Icon(
                                                      FontAwesomeIcons
                                                          .userLarge,
                                                      size: 90,
                                                      color: Colors.black,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width * 0.6,
                                                child: Text(
                                                  user["office_users"][i]
                                                      ["name"],
                                                  style: customTextStyle(
                                                      18.sp,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    ScreenUtil().screenWidth *
                                                        0.6,
                                                child: Text(
                                                  user["office_users"][i]
                                                      ["designation"],
                                                  style: customTextStyle(
                                                      14.sp,
                                                      Colors.black54,
                                                      FontWeight.w400),
                                                ),
                                              ),
                                              if ((user["office_users"][i]
                                                      ["mobile"])
                                                  .isNotEmpty)
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.62,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 25.sp,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Icon(
                                                                  FontAwesomeIcons
                                                                      .squarePhone,
                                                                  color: AppColor
                                                                      .kDarkGreen,
                                                                ),
                                                                SizedBox(
                                                                  width: 6,
                                                                ),
                                                                Container(
                                                                  width:
                                                                      Get.width *
                                                                          0.5,
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  height: 20.sp,
                                                                  child: Text(
                                                                    user["office_users"]
                                                                            [i][
                                                                        "mobile"],
                                                                    style: customTextStyle(
                                                                        14.sp,
                                                                        Colors
                                                                            .black54,
                                                                        FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -10,
                                                      child: IconButton(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 0,
                                                                  bottom: 10),
                                                          alignment: Alignment
                                                              .topCenter,
                                                          onPressed: () {
                                                            _launch(
                                                                "tel:${user["office_users"][i]["mobile"]}");
                                                          },
                                                          icon: const Icon(
                                                            Icons.phone,
                                                            color: AppColor
                                                                .kDarkGreen,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              if ((user["office_users"][i]
                                                      ["email"])
                                                  .isNotEmpty)
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.62,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Icon(
                                                            Icons.email,
                                                            color: AppColor
                                                                .kDarkGreen,
                                                          ),
                                                          SizedBox(
                                                            width: 6,
                                                          ),
                                                          Container(
                                                            width: Get.width *
                                                                0.48,
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              user["office_users"]
                                                                  [i]["email"],
                                                              style: customTextStyle(
                                                                  14.sp,
                                                                  Colors
                                                                      .black54,
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -10,
                                                      child: IconButton(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 0),
                                                          alignment: Alignment
                                                              .topCenter,
                                                          onPressed: () {
                                                            _launch(
                                                                "mailto:${user["office_users"][i]["email"]}");
                                                          },
                                                          icon: const Icon(
                                                            Icons.email,
                                                            color: Colors.grey,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                child: Card(
                                  margin: EdgeInsets.symmetric(vertical: 5.w),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10.h,
                                      bottom: 10.h,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 10.h,
                                            bottom: 10.h,
                                            left: 5.w,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(200.r),
                                            child: ClipRect(
                                              clipBehavior: Clip.antiAlias,
                                              child: Align(
                                                alignment: Alignment.center,
                                                widthFactor: .85,
                                                heightFactor: .85,
                                                child: CachedNetworkImage(
                                                  imageUrl: user['office_users']
                                                      [i]['photo'],
                                                  progressIndicatorBuilder:
                                                      (context, _, __) {
                                                    return Container(
                                                      child: Center(
                                                        heightFactor: 110,
                                                        widthFactor: 105,
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  },
                                                  height: 110,
                                                  width: 105,
                                                  fit: BoxFit.fill,
                                                  errorWidget:
                                                      (BuildContext context, _,
                                                          __) {
                                                    print(user['office_users']
                                                        [i]['photo']);
                                                    return Icon(
                                                      FontAwesomeIcons
                                                          .userLarge,
                                                      size: 90,
                                                      color: Colors.black,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Get.width * 0.6,
                                                child: Text(
                                                  user["office_users"][i]
                                                      ["name"],
                                                  style: customTextStyle(
                                                      18.sp,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ),
                                              ),
                                              SizedBox(
                                                width:
                                                    ScreenUtil().screenWidth *
                                                        0.6,
                                                child: Text(
                                                  user["office_users"][i]
                                                      ["designation"],
                                                  style: customTextStyle(
                                                      14.sp,
                                                      Colors.black54,
                                                      FontWeight.w400),
                                                ),
                                              ),
                                              if ((user["office_users"][i]
                                                      ["mobile"])
                                                  .isNotEmpty)
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.62,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 25.sp,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Icon(
                                                                  FontAwesomeIcons
                                                                      .squarePhone,
                                                                  color: AppColor
                                                                      .kDarkGreen,
                                                                ),
                                                                SizedBox(
                                                                  width: 6,
                                                                ),
                                                                Container(
                                                                  width:
                                                                      Get.width *
                                                                          0.5,
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  height: 20.sp,
                                                                  child: Text(
                                                                    user["office_users"]
                                                                            [i][
                                                                        "mobile"],
                                                                    style: customTextStyle(
                                                                        14.sp,
                                                                        Colors
                                                                            .black54,
                                                                        FontWeight
                                                                            .w400),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -10,
                                                      child: IconButton(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 0,
                                                                  bottom: 10),
                                                          alignment: Alignment
                                                              .topCenter,
                                                          onPressed: () {
                                                            _launch(
                                                                "tel:${user["office_users"][i]["mobile"]}");
                                                          },
                                                          icon: const Icon(
                                                            Icons.phone,
                                                            color: AppColor
                                                                .kDarkGreen,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              if ((user["office_users"][i]
                                                      ["email"])
                                                  .isNotEmpty)
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.62,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Icon(
                                                            Icons.email,
                                                            color: AppColor
                                                                .kDarkGreen,
                                                          ),
                                                          SizedBox(
                                                            width: 6,
                                                          ),
                                                          Container(
                                                            width: Get.width *
                                                                0.48,
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              user["office_users"]
                                                                  [i]["email"],
                                                              style: customTextStyle(
                                                                  14.sp,
                                                                  Colors
                                                                      .black54,
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -10,
                                                      child: IconButton(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 0),
                                                          alignment: Alignment
                                                              .topCenter,
                                                          onPressed: () {
                                                            _launch(
                                                                "mailto:${user["office_users"][i]["email"]}");
                                                          },
                                                          icon: const Icon(
                                                            Icons.email,
                                                            color: Colors.grey,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launch(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
