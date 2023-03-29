import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(debugLabel: '_scaffoldKey');
  
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
