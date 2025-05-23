import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onah_portfolio/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  // Ensure Flutter bindings are initialized before any Flutter specific code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Firebase Analytics (instance can be stored or used directly)
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // You might want to use the 'analytics' instance, for example, by logging an app_open event:
  // await analytics.logAppOpen();

  // Existing initializations
  usePathUrlStrategy();
  await dotenv.load(fileName: "env");

  runApp(const MyApp());
}