import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:travel_app/appColors/colors.dart';
import 'package:travel_app/firebase_options.dart';
import 'package:travel_app/views/home/home_page.dart';

Future<void> main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 5), () {
    FlutterNativeSplash.remove();
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kcPrimaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

