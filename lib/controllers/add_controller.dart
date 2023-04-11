import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AddController extends GetxController {
  int startIndex = 2;
  int? selectedLevel = 1;
  List<String> sites = ['Site 001', 'Site 002', 'Site 003', 'Site 004'];
  List<String> zones = ['Zone 001', 'Zone 002', 'Zone 003', 'Zone 004'];
  List<String> rooms = ['Room 001', 'Room 002', 'Room 003', 'Room 004'];
  List<String> minutes =
      List<String>.generate(12, (index) => '${(index + 1) * 5} Minutes');
  List<String> equipments = [
    'Equipment 001',
    'Equipment 002',
    'Equipment 003',
    'Equipment 004'
  ];
  String initSite = '';
  String initZone = '';
  String initRoom = '';
  String initEquipment = '';
  String initMinutes = '5 Minutes';
  RxBool savedSite = false.obs;
  RxBool savedZone = false.obs;
  ItemScrollController sController = ItemScrollController();
  String selectedLocation = 'room';
  String selectedPosition = 'inside';
  TextEditingController inputController = TextEditingController();

  int startForward = 0;

/* -------------------------------------------------------------------------- */
/*                           change saved site color                          */
/* -------------------------------------------------------------------------- */
  toggleSavedSite() {
    savedSite.toggle();
    update();
  }

/* -------------------------------------------------------------------------- */
/*                           change saved zone color                          */
/* -------------------------------------------------------------------------- */
  toggleSavedZone() {
    savedZone.toggle();
    update();
  }

/* -------------------------------------------------------------------------- */
/*                                select level value                          */
/* -------------------------------------------------------------------------- */
  setSelectedLevel(value) {
    selectedLevel = value;
    update();
  }

/* -------------------------------------------------------------------------- */
/*                               set zone value                               */
/* -------------------------------------------------------------------------- */
  setZone(value) {
    initZone = value;
    update();
  }

/* -------------------------------------------------------------------------- */
/*                               set site value                               */
/* -------------------------------------------------------------------------- */
  setSite(value) {
    initSite = value;
    update();
  }

  /* -------------------------------------------------------------------------- */
  /*                            change value of room                            */
  /* -------------------------------------------------------------------------- */
  setRoom(value) {
    initRoom = value;
    update();
  }

/* -------------------------------------------------------------------------- */
/*                          change value of equipment                         */
/* -------------------------------------------------------------------------- */
  setEquipment(value) {
    initEquipment = value;
    update();
  }

/* -------------------------------------------------------------------------- */
/*                           change value of minutes                          */
/* -------------------------------------------------------------------------- */
  setMinutes(value) {
    initMinutes = value;
    update();
  }

/* -------------------------------------------------------------------------- */
/*                         move forward in level value                        */
/* -------------------------------------------------------------------------- */
  moveForward() {
    if (startForward < 60) {
      startForward += 5;
      sController.jumpTo(index: startForward);
    }
  }

/* -------------------------------------------------------------------------- */
/*                         move backward in level value                        */
/* -------------------------------------------------------------------------- */
  moveBackward() {
    if (startForward > 0) {
      startForward -= 5;
      sController.jumpTo(index: startForward);
    }
  }


/* -------------------------------------------------------------------------- */
/*                  set type of location is room or equipment                 */
/* -------------------------------------------------------------------------- */
  setSelectedLocation(String type) {
    selectedLocation = type;
    update();
  }

/* -------------------------------------------------------------------------- */
/*                                set position                                */
/* -------------------------------------------------------------------------- */
  setSelectedPosition(String type) {
    selectedPosition = type;
    update();
  }

/* -------------------------------------------------------------------------- */
/*                                  add room                                  */
/* -------------------------------------------------------------------------- */
  addRoom() {
    if (inputController.text.isNotEmpty) {
      rooms.add(inputController.text);
      initRoom = inputController.text;
      update();
      Get.back();
      inputController.clear();
    } else {
      Get.snackbar('Error', 'Please fill all fields',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

/* -------------------------------------------------------------------------- */
/*                                add equipment                               */
/* -------------------------------------------------------------------------- */
  addEquipment() {
    if (inputController.text.isNotEmpty) {
      equipments.add(inputController.text);
      initEquipment = inputController.text;
      update();
      Get.back();
      inputController.clear();
    } else {
      Get.snackbar('Error', 'Please fill all fields',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    initSite = sites[0];
    initZone = zones[0];
    initRoom = rooms[0];
    initEquipment = equipments[0];
    initMinutes = minutes[0];
    super.onInit();
  }
}
