// import 'package:assign_project/controllers/news_details_controller.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class NewsDetailsScreen extends StatelessWidget {
//   const NewsDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: const Text("News App"),
//         ),
//         body: GetBuilder<NewsDetailsController>(
//             init: NewsDetailsController(),
//             builder: (controller) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                         height: 200.h,
//                         width: double.infinity,
//                         child: CachedNetworkImage(
//                           fit: BoxFit.cover,
//                           imageUrl: controller.news.urlToImage!,
//                           placeholder: (context, url) => Center(
//                             child: Container(
//                               width: 30.w,
//                               height: 30.h,
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         )),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20.w),
//                       child: Column(
//                         children: [
//                           15.verticalSpace,
//                           Text(
//                             controller.news.title!,
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           20.verticalSpace,
//                           Text(
//                             controller.news.description!,
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                             ),
//                           ),
//                           20.verticalSpace,
//                           Text(
//                             "Read more about this news here:",
//                             style: TextStyle(
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           10.verticalSpace,
//                           Text(
//                             controller.news.content!,
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                             ),
//                           ),
//                           20.verticalSpace,
//                           Text(
//                             "Source: ${controller.news.source!.name}",
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                             ),
//                           ),
//                           10.verticalSpace,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               controller.news.author == "Pas d'auteur"
//                                   ? Text(
//                                       " ${controller.news.author}",
//                                       style: TextStyle(
//                                         fontSize: 16.sp,
//                                       ),
//                                     )
//                                   : Text(
//                                       "Written by: ${controller.news.author}",
//                                       style: TextStyle(
//                                         fontSize: 16.sp,
//                                       ),
//                                     ),
//                               Text(
//                                 " at: ${controller.convertDate(controller.news.publishedAt)}",
//                                 style: TextStyle(
//                                   fontSize: 16.sp,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           20.verticalSpace,
//                           controller.news.url!.isEmpty
//                               ? Container()
//                               : ElevatedButton(
//                                   onPressed: () {
//                                     controller.launchURL(controller.news.url!);
//                                     Get.to(
//                                       () => WebView(cont: controller.cont),
//                                     );
//                                   },
//                                   child: Text("Read More")),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             }));
//   }
// }