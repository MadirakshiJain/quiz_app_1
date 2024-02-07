import 'package:flutter/material.dart';
import 'package:quiz/admin_login.dart';
import 'package:quiz/que.dart';
import 'package:quiz/queUI.dart';
import 'package:quiz/topics/civil.dart';
import 'package:quiz/topics/cse_topics.dart';
import 'package:quiz/topics/ee_topics.dart';
import 'package:quiz/topics/ecm.dart';
import 'package:quiz/topics/mec_topics.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Center(child: ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Cse_Topics()),
                  ); },
                  child:Text("Cse"))),

                  ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Mec_Topics()),
                  ); },
                  child:Text("mec")),

                  ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Ee_Topics()),
                  ); },
                  child:Text("ee")),
                  ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Ecm_Topics()),
                  ); },
                  child:Text("ecm")),
                  ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>Civil_Topics()),
                  ); },
                  child:Text("civil")),
                SizedBox(height: 60,),
                   ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>AdminLogin()),
                  ); },
                  child:Text("ADMIN"))
        ],
      ),
    );
  }
}