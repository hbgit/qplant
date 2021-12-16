import 'package:flutter/material.dart';
import 'package:qplant/StartApp.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final StartApp qplant = StartApp();
  runApp(qplant);
}
