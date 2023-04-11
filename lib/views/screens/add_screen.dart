import 'package:assign_project/controllers/add_controller.dart';
import 'package:assign_project/utils/colors.dart';
import 'package:assign_project/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manual alert',
          style: TextStyle(color: AppColors.textColor),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFE3E3E3),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: InkWell(
              child: Icon(
                CupertinoIcons.arrow_uturn_left,
                color: AppColors.textColor,
              ),
            ),
          )
        ],
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            width: 375.w,
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: GetBuilder<AddController>(
                init: AddController(),
                builder: (controller) {
                  return Column(
                    children: [
                      23.verticalSpace,
                      CustomLabel(
                        text: 'Site',
                        hasChild: true,
                      ),
                      6.verticalSpace,
                      DropDown(
                        hasTwoIcons: true,
                        secondIcon: NoBorderButton(
                          onPressed: () => controller.toggleSavedSite(),
                          iconColor: controller.savedSite.value
                              ? Color(0xFFFFCE31)
                              : Color(0xFFE5E5E5),
                          icon: Icons.bookmark,
                        ),
                        onChange: (value) => controller.setSite(value),
                        initValue: controller.initSite,
                        list: controller.sites,
                      ),
                      23.verticalSpace,
                      CustomLabel(
                        text: 'Zones',
                        hasChild: true,
                      ),
                      6.verticalSpace,
                      DropDown(
                        hasTwoIcons: true,
                        secondIcon: NoBorderButton(
                          onPressed: () => controller.toggleSavedZone(),
                          iconColor: controller.savedZone.value
                              ? Color(0xFFFFCE31)
                              : Color(0xFFE5E5E5),
                          icon: Icons.bookmark,
                        ),
                        onChange: (value) => controller.setZone(value),
                        initValue: controller.initZone,
                        list: controller.zones,
                      ),
                      23.verticalSpace,
                      CustomLabel(
                        text: 'Level',
                        hasChild: false,
                      ),
                      6.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 20.w,
                            constraints: BoxConstraints(minWidth: 20),
                            child: NoBorderButton(
                              icon: Icons.arrow_back_ios_outlined,
                              iconColor: AppColors.grayColor,
                              onPressed: () => controller.moveBackward(),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50.h,
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: ScrollablePositionedList.separated(
                                  itemScrollController: controller.sController,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Center(
                                    child: InkWell(
                                      onTap: () => controller
                                          .setSelectedLevel(index - 2),
                                      child: Container(
                                        width: 40.w,
                                        height: 40.w,
                                        constraints: BoxConstraints(
                                            minWidth: 30, minHeight: 30),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2.r),
                                            border: Border.all(
                                                color:
                                                    controller.selectedLevel ==
                                                            index - 2
                                                        ? AppColors.purple
                                                        : AppColors.grayColor),
                                            color: controller.selectedLevel ==
                                                    index - 2
                                                ? AppColors.purple
                                                : Colors.white),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${index - 2}',
                                          style: TextStyle(
                                              color: controller.selectedLevel ==
                                                      index - 2
                                                  ? Colors.white
                                                  : AppColors.textColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      6.horizontalSpace,
                                  itemCount: 63,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 20.w,
                            constraints: BoxConstraints(minWidth: 20),
                            child: NoBorderButton(
                              icon: Icons.arrow_forward_ios_outlined,
                              iconColor: AppColors.grayColor,
                              onPressed: () => controller.moveForward(),
                            ),
                          ),
                        ],
                      ),
                      23.verticalSpace,
                      CustomLabel(
                        text: 'Location',
                        hasChild: false,
                      ),
                      6.verticalSpace,
                      Row(
                        children: [
                          InkWell(
                            onTap: () => controller.setSelectedLocation('room'),
                            child: Container(
                              height: 40.h,
                              width: 161.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: controller.selectedLocation != 'room'
                                      ? Border.all(color: AppColors.grayColor)
                                      : null,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(2.r),
                                      bottomLeft: Radius.circular(2.r)),
                                  color: controller.selectedLocation == 'room'
                                      ? AppColors.purple
                                      : Colors.transparent),
                              child: Text(
                                'Room',
                                style: TextStyle(
                                    color: controller.selectedLocation == 'room'
                                        ? Colors.white
                                        : AppColors.textColor),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                controller.setSelectedLocation('equipment'),
                            child: Container(
                              height: 40.h,
                              width: 161.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: controller.selectedLocation !=
                                          'equipment'
                                      ? Border.all(color: AppColors.grayColor)
                                      : null,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(2.r),
                                      bottomRight: Radius.circular(2.r)),
                                  color:
                                      controller.selectedLocation == 'equipment'
                                          ? AppColors.purple
                                          : Colors.transparent),
                              child: Text(
                                'Equipment',
                                style: TextStyle(
                                    color: controller.selectedLocation ==
                                            'equipment'
                                        ? Colors.white
                                        : AppColors.textColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      23.verticalSpace,
                      CustomLabel(
                        text: controller.selectedLocation == 'room'
                            ? 'Room'
                            : 'Equipment',
                        hasChild: true,
                        child: InkWell(
                            onTap: () => showAddDialog(context,
                                title:
                                    'Add ${controller.selectedLocation == "room" ? "Room" : "Equipment"}',
                                hint: controller.selectedLocation == "room"
                                    ? "Room"
                                    : "Equipment",
                                controller: controller.inputController,
                                onPressed: controller.selectedLocation == 'room'
                                    ? () => controller.addRoom()
                                    : () => controller.addEquipment()),
                            child: Text(
                              '+add',
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 14.sp),
                            )),
                      ),
                      6.verticalSpace,
                      DropDown(
                        hasTwoIcons: false,
                        onChange: controller.selectedLocation == 'room'
                            ? (value) => controller.setRoom(value)
                            : (value) => controller.setEquipment(value),
                        initValue: controller.selectedLocation == 'room'
                            ? controller.initRoom
                            : controller.initEquipment,
                        list: controller.selectedLocation == 'room'
                            ? controller.rooms
                            : controller.equipments,
                      ),
                      23.verticalSpace,
                      CustomLabel(
                        text: 'Position',
                        hasChild: false,
                      ),
                      6.verticalSpace,
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                controller.setSelectedPosition('inside'),
                            child: Container(
                              height: 40.h,
                              width: 161.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: controller.selectedPosition !=
                                          'inside'
                                      ? Border.all(color: AppColors.grayColor)
                                      : null,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(2.r),
                                      bottomLeft: Radius.circular(2.r)),
                                  color: controller.selectedPosition == 'inside'
                                      ? AppColors.purple
                                      : Colors.transparent),
                              child: Text(
                                'Inside',
                                style: TextStyle(
                                    color:
                                        controller.selectedPosition == 'inside'
                                            ? Colors.white
                                            : AppColors.textColor),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                controller.setSelectedPosition('outside'),
                            child: Container(
                              height: 40.h,
                              width: 161.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: controller.selectedPosition !=
                                          'outside'
                                      ? Border.all(color: AppColors.grayColor)
                                      : null,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(2.r),
                                      bottomRight: Radius.circular(2.r)),
                                  color:
                                      controller.selectedPosition == 'outside'
                                          ? AppColors.purple
                                          : Colors.transparent),
                              child: Text(
                                'Outside',
                                style: TextStyle(
                                    color:
                                        controller.selectedPosition == 'outside'
                                            ? Colors.white
                                            : AppColors.textColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      23.verticalSpace,
                      CustomLabel(
                        text: 'Time expected to complete the job',
                        hasChild: false,
                      ),
                      6.verticalSpace,
                      DropDown(
                        hasTwoIcons: false,
                        onChange: (value) => controller.setMinutes(value),
                        initValue: controller.initMinutes,
                        list: controller.minutes,
                      ),
                      26.verticalSpace,
                      MaterialButton(
                        onPressed: () {},
                        height: 44.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r)),
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        elevation: 0,
                        color: Color(0xFF25A5DC),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.near_me_outlined,
                                color: Colors.white,
                                size: 20.w,
                              ),
                              13.horizontalSpace,
                              Text(
                                'Send alert',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
