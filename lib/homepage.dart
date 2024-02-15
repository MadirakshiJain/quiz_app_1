import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/admin_login.dart';
import 'package:quiz/que.dart';

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 240,
                    padding: EdgeInsets.only(left: 20, top: 50),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("lib/img/homepageimg.png"),
                          radius: 29,
                          ),
                        Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text("USERNAME",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 25)))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 70, top: 105),
                    child: Row(
                      children: [Image.asset("lib/img/homepageimg.png")],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Branches",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent,width: 2),
                        borderRadius: BorderRadius.circular(8),
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
                                      AssetImage("lib/img/homepageimg.png"),
                                  radius: 40,
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent),
                                        ),
                                      
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Cse_Topics()),
                                      );
                                    },
                                    child: Text("CSE",
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent,width: 2),
                        borderRadius: BorderRadius.circular(8),
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
                                      AssetImage("lib/img/homepageimg.png"),
                                  radius: 40,
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent),
                                        ),
                                      
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Mec_Topics()),
                                      );
                                    },
                                    child: Text("Mec",
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent,width: 2),
                        borderRadius: BorderRadius.circular(8),
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
                                      AssetImage("lib/img/homepageimg.png"),
                                  radius: 40,
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent),
                                        ),
                                      
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Ee_Topics()),
                                      );
                                    },
                                    child: Text("Ee",
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent,width: 2),
                        borderRadius: BorderRadius.circular(8),
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
                                      AssetImage("lib/img/homepageimg.png"),
                                  radius: 40,
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent),
                                        ),
                                      
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Ecm_Topics()),
                                      );
                                    },
                                    child: Text("Ecm",
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent,width: 2),
                        borderRadius: BorderRadius.circular(8),
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
                                      AssetImage("lib/img/homepageimg.png"),
                                  radius: 40,
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 200,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.blueAccent),
                                        ),
                                      
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Civil_Topics()),
                                      );
                                    },
                                    child: Text("Civil",
                                    style: TextStyle(color: Colors.white),),
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

              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminLogin()),
                    );
                  },
                  child: Text("ADMIN")),
            ],
          ),
        ),
      ),
    );
  }
}
