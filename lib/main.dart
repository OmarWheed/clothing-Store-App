import 'package:clothing_store/clothing_store_app.dart';
import 'package:clothing_store/core/di/di.dart';
import 'package:clothing_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ClothingStoreApp());
}
