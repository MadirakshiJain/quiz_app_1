import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/widgets/branches.dart';
import 'package:quiz/que_widgets.dart/widgets/test.dart';
import 'package:quiz/screens.dart/vidscreen.dart';
import 'package:quiz/services.dart/admin_login.dart';
import 'package:quiz/que_widgets.dart/widgets/que.dart';

import 'package:quiz/que_widgets.dart/topics/civil.dart';
import 'package:quiz/que_widgets.dart/topics/cse_topics.dart';
import 'package:quiz/que_widgets.dart/topics/ee_topics.dart';
import 'package:quiz/que_widgets.dart/topics/ecm.dart';
import 'package:quiz/que_widgets.dart/topics/mec_topics.dart';

class Ecm_Home extends StatelessWidget {
  const Ecm_Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hey !",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25,color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 160, 20, 184),
      iconTheme: IconThemeData.fallback(),
      ),
     drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 20, 184),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("Assets/electronics.png"),
                    radius: 40,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Hello!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
           
            Container(
                margin: EdgeInsets.only(top: 10,left: 5,right: 5),
               decoration: BoxDecoration(
                                    color: Colors.white,
                                     boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    blurRadius: 5,
                                                    spreadRadius: 3,
                                                    color: Color.fromARGB(
                                                            255, 220, 126, 243)
                                                        .withOpacity(.4),
                                                  ),
                                                ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
              child: ListTile(
                title: Text('Admin',style: TextStyle(color:Color.fromARGB(255, 160, 20, 184),fontSize: 20 )),
                onTap: () {
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminLogin()),
                            );
                }, ),
            ),
              Container(
                  margin: EdgeInsets.only(top: 10,left: 5,right: 5),
               decoration: BoxDecoration(
                                    color: Colors.white,
                                     boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    blurRadius: 5,
                                                    spreadRadius: 3,
                                                    color: Color.fromARGB(
                                                            255, 220, 126, 243)
                                                        .withOpacity(.4),
                                                  ),
                                                ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                child: ListTile(
                title: Text('Change Branch',style: TextStyle(color:Color.fromARGB(255, 160, 20, 184),fontSize: 20 ),),
                onTap: () {
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Branches()),
                            );
                }, ),
              ),
          ],
        ),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 655,
              //  height: (90.16 / 100) * MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 155,
                           width: 500,
                            padding: EdgeInsets.only(left: 50),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 160, 20, 184),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                                   ),
                          
                          Container(
                            margin: EdgeInsets.only(left: 70, top: 25),
                            child: Row(
                              children: [Image.asset("Assets/home.png")],
                            ),
                          )
                        ],
                      ),
                      
                        Container(
                          margin: EdgeInsets.only(left:20,right: 20),
                          child: Text("Welcome to Electronic Engineering Branch !",style: TextStyle(  fontSize: 25,color: Color.fromARGB(255, 138, 11, 160),fontWeight: FontWeight.w400))),
                     SizedBox(height: 20),
                      Center(child: Text("Let's play a quiz !",style: TextStyle(  fontStyle: FontStyle.italic, fontSize: 25,color: Color.fromARGB(255, 138, 11, 160),fontWeight: FontWeight.w300))),
                                              SizedBox(width: 15),
                                              
                       SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 170,
                            
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                 boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 1),
                                                blurRadius: 5,
                                                spreadRadius: 3,
                                                color: Color.fromARGB(
                                                        255, 220, 126, 243)
                                                    .withOpacity(.4),
                                              ),
                                            ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(20),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 30),
                                 Center(
                                        child: CircleAvatar(
                                          backgroundImage:
                                             AssetImage("Assets/cse.png"),
                                          radius: 45,
                                          backgroundColor:Colors.white,
                                          
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        child: SizedBox(
                                          width: 150,
                                          height: 40,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color.fromARGB(
                                                          255, 160, 20, 184)),
                                                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                ),
            ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Ecm_Topics()),
                                              );
                                            },
                                            child: Text(
                                              "Practise",
                                              style:
                                                  TextStyle(color: Colors.white,fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 170,
                              height: 200,
                             decoration: BoxDecoration(
                                color: Colors.white,
                                 boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 1),
                                                blurRadius: 5,
                                                spreadRadius: 3,
                                                color: Color.fromARGB(
                                                        255, 220, 126, 243)
                                                    .withOpacity(.4),
                                              ),
                                            ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(20),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 30),
                                         Center(
                                        child: CircleAvatar(
                                          backgroundImage:
                                             AssetImage("Assets/mec.png"),
                                          radius: 45,
                                          backgroundColor:Colors.white,
                                          
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(  borderRadius: BorderRadius.circular(10),
                              ),
                                        child: SizedBox(
                                           width: 150,
                                          height: 40,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color.fromARGB(
                                                          255, 160, 20, 184)),
                                                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                ),
            ),
                                            ),
                                            onPressed: () {
                                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestPage(selectedBranch: 'ECM',)),
                            );
                                            },
                                            child: Text(
                                              "Test",
                                              style:
                                                  TextStyle(color: Colors.white,fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                        
                          ],
                        ),
                      ),
                    
                    ],
                  ),
                ),
              ),
            ),
             
          ],
        ),
      ),
    );
  }
}
