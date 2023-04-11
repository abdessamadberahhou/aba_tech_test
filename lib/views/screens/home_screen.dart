import 'package:assign_project/controllers/home_controller.dart';
import 'package:assign_project/utils/colors.dart';
import 'package:assign_project/views/widgets/charts_widgets.dart';
import 'package:assign_project/views/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 812.h,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) {
                    return Container(
                      height: 95.h,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 11.w),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => DashboardWidget(
                                title: controller.cards[index].title,
                                subtitle: controller.cards[index].subTitle,
                                icon: controller.cards[index].icon,
                                bgColor: controller.cards[index].bgColor,
                                iconColor: controller.cards[index].iconColor,
                              ),
                          separatorBuilder: (context, index) =>
                              6.horizontalSpace,
                          itemCount: controller.cards.length),
                    );
                  }),
              GetBuilder<HomeController>(builder: (controller) {
                return Container(
                  height: controller.filter.isNotEmpty ? 30.h : 0,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                      itemBuilder: (context, index) => Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              alignment: Alignment.center,
                              height: 26.h,
                              
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                children: [
                                  Text(
                                    controller.filter[index],
                                    style: TextStyle(fontSize: 11.sp),
                                  ),
                                  5.horizontalSpace,
                                  InkWell(
                                      onTap: () =>
                                          controller.removeFromFilters(index),
                                      child: Icon(
                                        CupertinoIcons.xmark,
                                        size: 10.w,
                                      ))
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => 5.horizontalSpace,
                      itemCount: controller.filter.length),
                );
              }),
              10.verticalSpace,
              Container(
                height: 230.h,
                width: 375.w,
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0.05,
                          color: Colors.grey[500]!)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 375.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My observations',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  'Statistics',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Color(0xFFA4A4A4),
                                  ),
                                ),
                              ]),
                          InkWell(
                              onTap: () => showModal(context),
                              child: Icon(Icons.more_vert_outlined))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: BarChart(
                          BarChartData(
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 38,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: false,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingGroups(),
                            gridData: FlGridData(show: false),
                          ),
                          swapAnimationDuration:
                              Duration(milliseconds: 150), // Optional
                          swapAnimationCurve: Curves.linear,
                        ),
                      ),
                    ),
                    10.verticalSpace
                  ],
                ),
              ),
              10.verticalSpace,
              Container(
                height: 235.h,
                width: 375.w,
                constraints: BoxConstraints(minHeight: 215),
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0.05,
                          color: Colors.grey[500]!)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 375.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Progress',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  'Today',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Color(0xFFA4A4A4),
                                  ),
                                ),
                              ]),
                          InkWell(
                              onTap: () => showModal(context),
                              child: Icon(Icons.more_vert_outlined))
                        ],
                      ),
                    ),
                    GetBuilder<HomeController>(
                      builder: (controller) {
                      return Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                18.verticalSpace,
                                AspectRatio(
                                  aspectRatio:1 ,
                                  child: Container(
                                    width: 15,
                                    child: PieChart(
                                      PieChartData(
                                        pieTouchData: PieTouchData(
                                          touchCallback: (FlTouchEvent event,
                                                  pieTouchResponse) =>
                                              controller.changeTouchedIndex(
                                                  event, pieTouchResponse),
                                        ),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        sectionsSpace: 0,
                                        centerSpaceRadius: 35.h,
                                        sections: showingSections(
                                            controller.touchedIndex),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Indicator(
                                      color: Colors.blue,
                                      text: 'First',
                                      isSquare: true,
                                    ),
                                    5.verticalSpace,
                                    Indicator(
                                      color: Colors.yellow,
                                      text: 'Second',
                                      isSquare: true,
                                    ),
                                    5.verticalSpace,
                                    Indicator(
                                      color: Colors.purple,
                                      text: 'Third',
                                      isSquare: true,
                                    ),
                                    5.verticalSpace,
                                    Indicator(
                                      color: Colors.green,
                                      text: 'Fourth',
                                      isSquare: true,
                                    ),
                                    18.verticalSpace
                                  ],
                                ),
                                28.horizontalSpace
                              ],
                            )),
                      );
                    }),
                    10.verticalSpace
                  ],
                ),
              ),
              if(Get.size.height < 700)
              70.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
