import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz/category.dart';
import 'package:quiz/firebase_options.dart';
import 'package:quiz/homepage.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Your App Title',
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homepage()
    );
  }
}

