import 'package:assign_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: Container(
        width: 375.w,
        child: ScrollConfiguration(
          behavior: Utils.ScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(),
          ),
        ),
      ),
    );
  }
}
