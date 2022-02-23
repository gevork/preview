import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runZonedGuarded(() {
    runApp(const App());
  }, (Object error, StackTrace stack) {});
}
