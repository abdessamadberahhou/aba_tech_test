// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:assign_project/utils/models/news.dart';
import 'package:assign_project/utils/palette.dart';
import 'package:assign_project/views/screens/news_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PrimaryTextField extends StatelessWidget {
  String? text;
  IconData? icon;
  TextEditingController? controller;
  void Function(String)? onChanged;
  PrimaryTextField(
      {super.key, this.text, this.icon, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => onChanged!(value),
      decoration: InputDecoration(
        hintText: text!,
        prefixIcon: Icon(icon ?? Icons.message),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Palette.borderColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Palette.primaryColor, width: 1.5.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Palette.borderColor, width: 1.w),
        ),
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  String? title, author, date, source;
  String imagePath;
  News? news;
  NewsWidget(
      {super.key,
      this.author,
      this.date,
      this.news,
      this.imagePath = '',
      this.source,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Get.to(() => NewsDetailsScreen(),
              transition: Transition.rightToLeftWithFade, arguments: news),
          child: Column(
            children: [
              Container(
                height: 110.h,
                width: 165.w,
                constraints: BoxConstraints(minHeight: 100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/noimage.png'),
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text('Author: '),
                        Container(
                          constraints: BoxConstraints(maxWidth: 90),
                          child: Text(
                            author ?? 'unkown',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: (source != null && date != null)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              Text(DateFormat('yyyy-dd-MM').format(DateTime.parse(date!))),
              Container(
                constraints: BoxConstraints(maxWidth: 70.w),
                child: Text(
                  source!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey[500]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

PreferredSize CustomAppbar() => PreferredSize(
    preferredSize: Size(375.w, 60.h),
    child: AppBar(
      title: Text('News App'),
      toolbarHeight: 60.h,
      elevation: 0,
    ));
