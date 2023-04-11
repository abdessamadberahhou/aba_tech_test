import 'package:assign_project/utils/models/card.dart';
import 'package:assign_project/utils/models/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int touchedIndex = -1;
  PageController pController = PageController();

  /* -------------------------------------------------------------------------- */
  /*                           list of dashboard card                           */
  /* -------------------------------------------------------------------------- */
  List<AppCard> cards = [
    AppCard(
        title: '150',
        subTitle: 'My Observation',
        icon: CupertinoIcons.eyeglasses,
        bgColor: Color(0xFFC1E2F4),
        iconColor: Color(0xFF1488CC)),
    AppCard(
        title: '4',
        subTitle: 'Pending',
        icon: CupertinoIcons.pause,
        bgColor: Color(0xFFC1E2F4),
        iconColor: Color(0xFF1488CC)),
    AppCard(
        title: '1',
        subTitle: 'Progress',
        icon: CupertinoIcons.timer,
        bgColor: Color(0xFFFFEDAA),
        iconColor: Color(0xFFA1820A)),
    AppCard(
        title: '2',
        subTitle: 'Resolved',
        icon: CupertinoIcons.checkmark_alt,
        bgColor: Color(0xFFBFFFC9),
        iconColor: Color(0xFF4AB85B)),
    AppCard(
        title: '1',
        subTitle: 'Closed',
        icon: CupertinoIcons.lock,
        bgColor: Color(0xFFE9E9E9),
        iconColor: Color(0xFF616161))
  ];

  /* -------------------------------------------------------------------------- */
  /*                               list of filters                              */
  /* -------------------------------------------------------------------------- */
  List<String> filter = [
    'Daily',
    'Safety',
    'Excellent',
    'Bad condition',
    'Good condition'
  ];

/* -------------------------------------------------------------------------- */
/*                            List of modal filter                            */
/* -------------------------------------------------------------------------- */
  List<Filter> modalFilter = [
    Filter(icon: Icons.calendar_month, text: 'Date', onPressed: () {}),
    Filter(icon: Icons.layers_outlined, text: 'Type', onPressed: () {}),
    Filter(icon: Icons.info_outline, text: 'Status', onPressed: () {}),
    Filter(icon: Icons.category_outlined, text: 'Category', onPressed: () {}),
    Filter(
        icon: Icons.account_tree_outlined,
        text: 'Subcategorey',
        onPressed: () {}),
    Filter(icon: Icons.label, text: 'Tags', onPressed: () {}),
  ];

  changeTouchedIndex(event, pieTouchResponse) {
    if (!event.isInterestedForInteractions ||
        pieTouchResponse == null ||
        pieTouchResponse.touchedSection == null) {
      touchedIndex = -1;
      update();
      return;
    }
    touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
    update();
  }

  removeFromFilters(index) {
    filter.removeAt(index);
    update();
  }
}
