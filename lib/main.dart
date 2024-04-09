import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/widgets/category.dart';
import 'package:quiz/screens.dart/welcome.dart';
import 'package:quiz/services.dart/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Your App Title',
        home: WelcomeScreen(),
      ),
    ),
  );
}


