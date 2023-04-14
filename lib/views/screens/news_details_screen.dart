import 'package:assign_project/controllers/news_details_controller.dart';
import 'package:assign_project/utils/palette.dart';
import 'package:assign_project/utils/utils.dart';
import 'package:assign_project/views/screens/web_view.dart';
import 'package:assign_project/views/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar(),
        body: GetBuilder<NewsDetailsController>(
            init: NewsDetailsController(),
            builder: (controller) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: 230.h,
                          width: 375.w,
                          constraints: BoxConstraints(minHeight: 180),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: controller.news.urlToImage!,
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Palette.primaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.circular(12.r),
                            )),
                        child: Text(
                          controller.news.title!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            Text(
                              'Description:',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: 70.w,
                              height: 2.h,
                              color: Palette.borderColor,
                            ),
                            10.verticalSpace,
                            Text(
                              controller.news.description!,
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                            25.verticalSpace,
                            Text(
                              'More informations:',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: 70.w,
                              height: 2.h,
                              color: Palette.borderColor,
                            ),
                            10.verticalSpace,
                            Text(
                              controller.news.content!,
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                            25.verticalSpace,
                            Row(
                              children: [
                                Text(
                                  "Source: ",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  controller.news.source!.name!,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Written by: ",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  controller.news.author ?? '',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Published on: ",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                    "${controller.formatDate(controller.news.publishedAt)}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            20.verticalSpace,
                            controller.news.url!.isEmpty
                                ? 0.verticalSpace
                                : Center(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(150.w, 40.h),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.r)),
                                            elevation: 0),
                                        onPressed: () {
                                          controller.openBrowser(
                                              controller.news.url!);
                                          Get.to(
                                              () => WebView(
                                                  cont: controller.cont!),
                                              transition: Transition
                                                  .rightToLeftWithFade);
                                        },
                                        child: Text(
                                          "Visit our site",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                            15.verticalSpace
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
