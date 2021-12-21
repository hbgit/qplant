import 'package:flutter/material.dart';
import 'package:qplant/StartApp.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: "assets/config.env");
  final StartApp qplant = StartApp();
  runApp(qplant);
}
