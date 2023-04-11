import 'package:flutter/material.dart';

class Filter {
  IconData icon;
  String text;
  VoidCallback onPressed;
  Filter({required this.icon, required this.text, required this.onPressed});
}
