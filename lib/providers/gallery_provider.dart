import 'package:flutter/material.dart';

class GalleryProvider with ChangeNotifier{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  set currentIndex(int currentIndex){
    _currentIndex = currentIndex;
    notifyListeners();
  }
}