import 'package:assign_project/utils/constants.dart';
import 'package:assign_project/utils/models/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<News> news = [];
  int page = 1;
  int searchPage = 1;
  int pageSize = 16;
  TextEditingController searchController = TextEditingController();
  Dio dio = Dio();
  RxBool loading = true.obs;
  ScrollController sController = ScrollController();
  RxBool loadingMore = false.obs;

/* -------------------------------------------------------------------------- */
/*                            normal fetch all news                           */
/* -------------------------------------------------------------------------- */
  initFetch() async {
    update();
    news.clear();
    try {
      page = 1;
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
      }).catchError((e) {
        if (e.toString().contains('429')) {
          Get.snackbar('Error', 'Please refresh your API_KEY',
              backgroundColor: Colors.red[800], colorText: Colors.white);
        } else if (e.toString().contains('426')) {
          Get.snackbar('Info', 'You already load all news',
              backgroundColor: Colors.red[800], colorText: Colors.white);
        } else {
          throw e;
        }
      });
    } catch (er) {
      rethrow;
    }
  }

/* -------------------------------------------------------------------------- */
/*                                  searching                                 */
/* -------------------------------------------------------------------------- */
  search(String query) async {
    loading.value = true;
    if (query.isNotEmpty) {
      news.clear();
      update();
      await dio
          .get(
              'https://newsapi.org/v2/everything?q=$query&from=2023-03-20&sortBy=publishedAt&apiKey=${Constants.apiKey}&page=1&pageSize=$pageSize')
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
      }).catchError((e) {
        if (e.toString().contains('429')) {
          Get.snackbar('Error', 'Please refresh your API_KEY',
              backgroundColor: Colors.red[800], colorText: Colors.white);
        } else if (e.toString().contains('426')) {
          Get.snackbar('Info', 'You already load all news',
              backgroundColor: Colors.red[800], colorText: Colors.white);
        } else {
          throw e;
        }
      });
    } else {
      initFetch();
    }
  }

  loadMore(String query) async {
    loadingMore.toggle();
    update();
    if (query.isNotEmpty) {
      /* -------------------------------------------------------------------------- */
      /*             in case searching loading more about searched value            */
      /* -------------------------------------------------------------------------- */
      searchPage += 1;
      await dio
          .get(
              'https://newsapi.org/v2/everything?q=$query&from=2023-03-20&sortBy=publishedAt&apiKey=${Constants.apiKey}&page=$searchPage&pageSize=$pageSize')
          .then((response) {
        switch (response.statusCode) {
          case 200:
            response.data['articles'].forEach((element) {
              news.add(News.fromJson(element));
            });
            loadingMore.toggle();
            update();
            break;
          case 401:
            Get.snackbar('API key error', 'You are not logged in');
            loadingMore.toggle();
            update();
            break;
          default:
            Get.snackbar('Error', 'Server error');
            loadingMore.toggle();
            update();
            break;
        }
      }).catchError((e) {
        loadingMore.toggle();
        update();
        if (e.toString().contains('429')) {
          Get.snackbar('Error', 'Please refresh your API_KEY',
              backgroundColor: Colors.red[800], colorText: Colors.white);
        } else if (e.toString().contains('426')) {
          Get.snackbar('Info', 'You already load all news',
              backgroundColor: Colors.red[800], colorText: Colors.white);
        } else {
          throw e;
        }
      });
    } else {
      /* -------------------------------------------------------------------------- */
      /*               in case not searching loading more popular news              */
      /* -------------------------------------------------------------------------- */
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
            loadingMore.toggle();
            update();
            break;
          case 401:
            Get.snackbar('API key error', 'You are not logged in');
            loadingMore.toggle();
            update();
            break;
          default:
            Get.snackbar('Error', 'Server error');
            loadingMore.toggle();
            update();
            break;
        }
      }).catchError((e) {
        loadingMore.toggle();
        update();
        if (e.toString().contains('429')) {
          Get.snackbar('Error', 'Please refresh your API_KEY',
              backgroundColor: Colors.red[800], colorText: Colors.white);
        } else if (e.toString().contains('426')) {
          Get.snackbar('Info', 'You already load all news',
              backgroundColor: Colors.red[800], colorText: Colors.white);
        } else {
          throw e;
        }
      });
    }
  }

  @override
  void onInit() {
    initFetch();
    sController.addListener(() {
      double maxScroll = sController.position.maxScrollExtent;
      if (sController.position.pixels == maxScroll) {
        loadMore(searchController.text);
      }
    });
    super.onInit();
  }
}
