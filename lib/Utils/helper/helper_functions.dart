import 'package:flutter/material.dart';

class ThelperFunctions {
  // Function to check if a string is empty or null
  static bool isStringEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  // Function to check if a list is empty or null
  static bool isListEmpty(List? list) {
    return list == null || list.isEmpty;
  }

  // Function to check if a map is empty or null
  static bool isMapEmpty(Map? map) {
    return map == null || map.isEmpty;
  }

  static bool isDarkModeEnabled(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
