// ignore_for_file: must_be_immutable

import 'package:assign_project/controllers/home_charts_controller.dart';
import 'package:assign_project/controllers/home_controller.dart';
import 'package:assign_project/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

/* -------------------------------------------------------------------------- */
/*                          dashboard first widget                         */
/* -------------------------------------------------------------------------- */
class DashboardWidget extends StatelessWidget {
  String title, subtitle;
  IconData icon;
  Color bgColor, iconColor;
  DashboardWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.bgColor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 172.w,
          height: 60.h,
          constraints: BoxConstraints(minHeight: 60),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7.r)),
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            minVerticalPadding: 0,
            leading: Container(
              width: 35.w,
              height: 35.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500), color: bgColor),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            dense: true,
            visualDensity: VisualDensity(vertical: 0),
            title: Text(title,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
            subtitle: Text(
              subtitle,
              style: TextStyle(fontSize: 12.sp),
            ),
          )
          //
          ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                             indicator of charts                            */
/* -------------------------------------------------------------------------- */
class Indicator extends StatelessWidget {
  Indicator({
    super.key,
    required this.color,
    required this.text,
    this.isSquare = false,
    this.size,
    this.textColor,
  });
  final Color color;
  final String text;
  bool isSquare;
  final double? size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size ?? 8.w,
          height: size ?? 8.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: color,
          ),
        ),
        5.horizontalSpace,
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: textColor,
          ),
        )
      ],
    );
  }
}


/* -------------------------------------------------------------------------- */
/*                             bottom navbar item                             */
/* -------------------------------------------------------------------------- */
class BottomNavbarItem extends StatelessWidget {
  IconData icon;
  Color iconColor, bgColor;
  VoidCallback onPressed;
  BottomNavbarItem(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.bgColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      elevation: 0,
      minWidth: 10.w,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => onPressed(),
      child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(10.r)),
          child: Icon(
            icon,
            size: 25.sp,
            color: iconColor,
          )),
    );
  }
}


/* -------------------------------------------------------------------------- */
/*                                Filter modal                                */
/* -------------------------------------------------------------------------- */
showModal(context) => showMaterialModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r))),
      builder: (context) => FittedBox(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 10.h),
            width: 375.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  child: Icon(CupertinoIcons.xmark),
                  onTap: () => Get.back(),
                ),
                Text('Filtred by'),
                TextButton(
                  child: Text('Clear'),
                  onPressed: () {},
                )
              ],
            ),
          ),
          GetBuilder<HomeController>(
            builder: (controller) => Container(
              width: 375.w,
              child: ListView.separated(
                  padding: EdgeInsets.only(top: 8.h),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 35.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                controller.modalFilter[index].icon,
                                color: AppColors.grayColor,
                              ),
                              Container(
                                  width: 250.w,
                                  child: Text(
                                    controller.modalFilter[index].text,
                                    style: TextStyle(
                                        color: AppColors.grayColor,
                                        fontSize: 15.sp),
                                  )),
                              Icon(Icons.keyboard_arrow_right_rounded,
                                  color: AppColors.grayColor)
                            ]),
                      ),
                  itemCount: controller.modalFilter.length,
                  separatorBuilder: (context, index) => 16.verticalSpace),
            ),
          ),
          25.verticalSpace
        ]),
      ),
    );

/* -------------------------------------------------------------------------- */
/*                              add input dialog                              */
/* -------------------------------------------------------------------------- */
showAddDialog(context, {hint, onPressed, title, controller}) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(fontSize: 16.sp),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50.h,
              width: 375.w,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: AppColors.grayColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: AppColors.grayColor),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(color: AppColors.grayColor),
                  ),
                ),
              ),
            )
          ],
        ),
        actions: [TextButton(onPressed: () => onPressed(), child: Text('Add'))],
      ),
    );


/* -------------------------------------------------------------------------- */
/*                                bottom navabr                               */
/* -------------------------------------------------------------------------- */
class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(
        init: MainScreenController(),
        builder: (controller) {
          return BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 5.h,
            child: Container(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300.w / 2,
                    alignment: Alignment.center,
                    child: BottomNavbarItem(
                      icon: Icons.dashboard,
                      bgColor: controller.curIndex == 0
                          ? AppColors.primary.withOpacity(0.2)
                          : AppColors.grayColor.withOpacity(0.2),
                      iconColor: controller.curIndex == 0
                          ? AppColors.primary
                          : AppColors.grayColor,
                      onPressed: () => controller.setCurIndex(0),
                    ),
                  ),
                  Container(
                    width: 300.w / 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BottomNavbarItem(
                          icon: CupertinoIcons.eyeglasses,
                          bgColor: controller.curIndex == 1
                              ? AppColors.primary.withOpacity(0.2)
                              : AppColors.grayColor.withOpacity(0.2),
                          iconColor: controller.curIndex == 1
                              ? AppColors.primary
                              : AppColors.grayColor,
                          onPressed: () => controller.setCurIndex(1),
                        ),
                        BottomNavbarItem(
                          icon: CupertinoIcons.doc_chart,
                          bgColor: controller.curIndex == 2
                              ? AppColors.primary.withOpacity(0.2)
                              : AppColors.grayColor.withOpacity(0.2),
                          iconColor: controller.curIndex == 2
                              ? AppColors.primary
                              : AppColors.grayColor,
                          onPressed: () => controller.setCurIndex(2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}


/* -------------------------------------------------------------------------- */
/*                         normal button in add screen                        */
/* -------------------------------------------------------------------------- */
class NoBorderButton extends StatelessWidget {
  VoidCallback? onPressed;
  IconData? icon;
  Color? iconColor;
  NoBorderButton({super.key, this.onPressed, this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      elevation: 0,
      minWidth: 0.w,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity(horizontal: 0, vertical: 0),
      onPressed: () => onPressed!(),
      child: Icon(
        icon!,
        color: iconColor,
      ),
    );
  }
}

class CustomLabel extends StatelessWidget {
  String text;
  Widget? child;
  bool hasChild;
  CustomLabel(
      {super.key, required this.text, this.child, required this.hasChild});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          hasChild ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textColor),
        ),
        if (hasChild)
          InkWell(
            child: child ??
                Icon(Icons.info_outline,
                    size: 16.w, color: AppColors.grayColor),
          )
      ],
    );
  }
}


/* -------------------------------------------------------------------------- */
/*                               dropdown widget                              */
/* -------------------------------------------------------------------------- */
class DropDown extends StatelessWidget {
  List<String> list;
  void Function(String) onChange;
  bool hasTwoIcons;
  Widget? secondIcon;
  String initValue;
  DropDown(
      {super.key,
      required this.list,
      required this.onChange,
      this.hasTwoIcons = true,
      this.secondIcon,
      required this.initValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayColor),
          borderRadius: BorderRadius.circular(2.r)),
      padding: EdgeInsets.only(left: 17.w),
      child: DropdownButton<String>(
        value: initValue,
        underline: 0.verticalSpace,
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(width: 225.w, child: Text(value)),
          );
        }).toList(),
        onChanged: (value) => onChange(value!),
        icon: Row(
          mainAxisAlignment:
              hasTwoIcons ? MainAxisAlignment.center : MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              child: secondIcon ?? 40.horizontalSpace),
            Icon(
              Icons.arrow_drop_down_rounded,
              size: 35.w,
              color: AppColors.textColor,
            )
          ],
        ),
      ),
    );
  }
}
