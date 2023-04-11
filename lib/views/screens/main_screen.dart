import 'package:assign_project/controllers/home_charts_controller.dart';
import 'package:assign_project/utils/colors.dart';
import 'package:assign_project/views/screens/add_screen.dart';
import 'package:assign_project/views/screens/home_screen.dart';
import 'package:assign_project/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.5.h,
          ),
        ),
        toolbarHeight: 60.h,
        backgroundColor: Colors.white,
        title: Text(
          'Overview',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                  alignment: Alignment.center,
                  color: Color(0xFFDDDDDD),
                  iconSize: 25.w,
                ),
                Container(
                  width: 35.w,
                  height: 35.h,
                  constraints: BoxConstraints(minHeight: 35, minWidth: 35),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.asset(
                      'assets/images/image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: GetBuilder<MainScreenController>(
          init: MainScreenController(),
          builder: (controller) {
            return PageView(
              controller: controller.pController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                Center(child: Text('page 2')),
                Center(child: Text('page 3')),
              ],
            );
          }),
      bottomNavigationBar: BottomNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () =>Get.to(()=>AddScreen()),
          child: Container(
            padding: EdgeInsets.all(8),
            width: 60.w,
            height: 60.w,
            decoration:
                BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              size: 30.w,
              color: Colors.white,
            ),
          )),
    );
  }
}


