import 'package:assign_project/controllers/home_controller.dart';
import 'package:assign_project/utils/palette.dart';
import 'package:assign_project/utils/utils.dart';
import 'package:assign_project/views/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        toolbarHeight: 60.h,
        elevation: 0,
      ),
      body: Container(
        width: 375.w,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return SingleChildScrollView(
                  controller: controller.sController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: PrimaryTextField(
                          text: 'Search',
                          icon: CupertinoIcons.search,
                          controller: controller.searchController,
                          onChanged: (value) => controller.search(value),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: controller.loading.value
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controller.loading.value
                              ? Center(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 150.h),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    width: 270.w,
                                    height: 200.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: SizedBox(
                                            height: 50.0,
                                            width: 50.0,
                                            child: CircularProgressIndicator(
                                              value: null,
                                              strokeWidth: 7.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25.0),
                                          child: Center(
                                            child: Text(
                                              "loading...",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 165 / 228,
                                          crossAxisSpacing: 10.w,
                                          mainAxisSpacing: 10.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.news.length,
                                  itemBuilder: (context, index) => Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey[400]!,
                                              offset: Offset(0, 1),
                                              spreadRadius: 1,
                                              blurRadius: 5)
                                        ]),
                                    child: NewsWidget(
                                        title: controller.news[index].title,
                                        imagePath:
                                            controller.news[index].urlToImage ??
                                                '',
                                        author: controller.news[index].author,
                                        date:
                                            controller.news[index].publishedAt,
                                        source: controller
                                            .news[index].source!.name),
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
