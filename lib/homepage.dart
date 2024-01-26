import 'package:flutter/material.dart';
import 'package:quiz/que.dart';
import 'package:quiz/queUI.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 400,),
          Center(child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Que()),
                  ); },
                  child:Text("quiz")))
        ],
      ),
    );
  }
}