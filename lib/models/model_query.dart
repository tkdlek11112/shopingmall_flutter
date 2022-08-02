import 'package:flutter/material.dart';

class QueryProvider with ChangeNotifier {
  String text = '';

  void updateText(String newText) {
    text = newText;
    notifyListeners();
  }
}