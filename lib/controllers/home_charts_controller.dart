import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  PageController pController = PageController();
  int curIndex = 0;

/* -------------------------------------------------------------------------- */
/*                         chnage page in main Screen                         */
/* -------------------------------------------------------------------------- */
  setCurIndex(index) {
    curIndex = index;
    pController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
    update();
  }
}
