import 'package:assign_project/utils/constants.dart';
import 'package:assign_project/utils/models/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<News> news = [];
  int page = 1;
  int pageSize = 16;
  TextEditingController searchController = TextEditingController();
  Dio dio = Dio();
  RxBool loading = true.obs;
  ScrollController sController = ScrollController();

  initFetch() async {
    update();
    news.clear();
    try {
      await dio
          .get(
              'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=${Constants.apiKey}&page=$page&pageSize=$pageSize')
          .then((response) {
        switch (response.statusCode) {
          case 200:
            response.data['articles'].forEach((element) {
              news.add(News.fromJson(element));
            });
            loading.value = false;
            update();
            break;
          case 401:
            Get.snackbar('API key error', 'You are not logged in');
            break;
          default:
            Get.snackbar('Error', 'Server error');
        }
      });
    } catch (er) {}
  }

  search(String query) async {
    loading.value = true;
    try {
      if (query.isNotEmpty) {
        news.clear();
        update();
        await dio
            .get(
                'https://newsapi.org/v2/everything?q=$query&from=2023-03-13&sortBy=publishedAt&apiKey=${Constants.apiKey}&page=$page&pageSize=$pageSize')
            .then((response) {
          switch (response.statusCode) {
            case 200:
              response.data['articles'].forEach((element) {
                news.add(News.fromJson(element));
              });
              loading.value = false;
              update();
              break;
            case 401:
              Get.snackbar('API key error', 'You are not logged in');
              break;
            default:
              Get.snackbar('Error', 'Server error');
          }
        });
      } else {
        initFetch();
      }
    } catch (er) {}
  }

  loadMore() async {
    page += 1;
    await dio
        .get(
            'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=${Constants.apiKey}&page=$page&pageSize=$pageSize')
        .then((response) {
      switch (response.statusCode) {
        case 200:
          response.data['articles'].forEach((element) {
            news.add(News.fromJson(element));
          });
          update();
          break;
        case 401:
          Get.snackbar('API key error', 'You are not logged in');
          break;
        default:
          Get.snackbar('Error', 'Server error');
      }
    });
  }

  @override
  void onInit() {
    initFetch();
    sController.addListener(() {
      double maxScroll = sController.position.maxScrollExtent;
      double currentScroll = sController.position.pixels;
      double delta = 200.0; // or something else..
      if (maxScroll - currentScroll <= delta) {
        //
        print('scrolled');  
        loadMore();
      }
    });
    super.onInit();
  }
}
