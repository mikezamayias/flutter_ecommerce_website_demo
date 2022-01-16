import 'package:flutter/material.dart';

class ScaffoldKeyService {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ScaffoldState? get currentState => _scaffoldKey.currentState;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
}
