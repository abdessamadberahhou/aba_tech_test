import 'package:assign_project/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EasySplashScreen(
          backgroundImage: AssetImage(
            'assets/images/splash_background.png',
          ),
          logo: Image.asset('assets/images/logo.png', width: 80.w,),
          backgroundColor: Color(0xFF2E166A),
          showLoader: false,
          navigator: MainScreen(),
          durationInSeconds: 5,
        ),
      ),
    );
  }
}