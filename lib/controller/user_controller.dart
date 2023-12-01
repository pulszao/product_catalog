import 'dart:io';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  File? _userImage;

  void setUserImage(File? image) async {
    _userImage = image;
    notifyListeners();
  }

  File? getUserImage() {
    return _userImage;
  }
}
