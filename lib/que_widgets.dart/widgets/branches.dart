import 'package:flutter/material.dart';
import 'package:quiz/screens.dart/bottomNav.dart';
import 'package:quiz/que_widgets.dart/homepage/civil_home.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';
import 'package:quiz/que_widgets.dart/homepage/ecm_home.dart';
import 'package:quiz/que_widgets.dart/homepage/ee_home.dart';
import 'package:quiz/que_widgets.dart/homepage/mec_home.dart';

class Branches extends StatelessWidget {
 const Branches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70,left: 15,right: 15),
              color: Colors.white,
              child: Column(
                children: [
                  Text("CHOOSE  YOUR  BRANCH ", style: TextStyle(
                            color:    Color.fromARGB(255, 131, 7, 153),fontSize: 25,fontWeight: FontWeight.bold)),
                            SizedBox(height: 40,),
                  GestureDetector(
                    onTap: (){
                       Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CseBottomNav()),
                            );
                    },
                    child: Expanded(
                      child: Container(
                          constraints: BoxConstraints(
                                                        minWidth: 500, minHeight: 100),
                                 
                                   decoration: BoxDecoration(
                                    color: Colors.white,
                                     boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 1),
                                                    blurRadius: 5,
                                                    spreadRadius: 3,
                                                    color: Color.fromRGBO(220, 126, 243, 1)
                                                        .withOpacity(.4),
                                                  ),
                                                ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            
                            children: [
                              CircleAvatar(
                                                backgroundImage:
                                                   AssetImage("Assets/cse.png"),
                                                radius: 30,
                                                backgroundColor:Colors.white,
                                                
                                              ),
                                                SizedBox(width: 10,),
                                                        Expanded(
                                                          child: Text("Computer Science", style: TextStyle(
                                                            color: Color.fromARGB(255, 160, 20, 184),fontSize: 25,fontWeight: FontWeight.w400),),
                                                        ),
                            ],
                          ),
                        ),
                      ),
                   
                    ),
                  ),
                  SizedBox(height: 25,),
                 GestureDetector(
                   onTap: (){
                       Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>MechBottomNav()),
                            );
                    },
                   child:
                    Expanded(
                      child: Container(
                          constraints: BoxConstraints(
                                                        minWidth: 500, minHeight: 100),
                                 
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            
                            children: [
                              CircleAvatar(
                                                backgroundImage:
                                                   AssetImage("Assets/mec.png"),
                                                radius: 30,
                                                backgroundColor:Colors.white,
                                                
                                              ),
                                                SizedBox(width: 10,),
                                                        Expanded(
                                                          child: Text("Mechanical Engineering", style: TextStyle(
                                                            color: Color.fromARGB(255, 160, 20, 184),fontSize: 25,fontWeight: FontWeight.w400),),
                                                        ),
                            ],
                          ),
                        ),
                      ),
                   
                    ),
                 ),
                  SizedBox(height: 25,),
                 GestureDetector(
                onTap:(){
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EeBottomNav()),
                            );
                } ,
                   child:
                    Expanded(
                      child: Container(
                          constraints: BoxConstraints(
                                                        minWidth: 500, minHeight: 100),
                                 
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            
                            children: [
                              CircleAvatar(
                                                backgroundImage:
                                                   AssetImage("Assets/electrical.png"),
                                                radius: 30,
                                                backgroundColor:Colors.white,
                                                
                                              ),
                                                SizedBox(width: 10,),
                                                        Expanded(
                                                          child: Text("Electrical Engineering", style: TextStyle(
                                                            color: Color.fromARGB(255, 160, 20, 184),fontSize: 25,fontWeight: FontWeight.w400),),
                                                        ),
                            ],
                          ),
                        ),
                      ),
                   
                    ),
                 ),
                  SizedBox(height: 25,),
                 GestureDetector(
                  onTap: (){
                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EcmBottomNav()),
                            );
                  },
                   child: 
                   Expanded(
                      child: Container(
                          constraints: BoxConstraints(
                                                        minWidth: 500, minHeight: 100),
                                 
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            
                            children: [
                              CircleAvatar(
                                                backgroundImage:
                                                   AssetImage("Assets/electronics.png"),
                                                radius: 30,
                                                backgroundColor:Colors.white,
                                                
                                              ),
                                                SizedBox(width: 10,),
                                                        Expanded(
                                                          child: Text("Electronic Engineering", style: TextStyle(
                                                            color: Color.fromARGB(255, 160, 20, 184),fontSize: 25,fontWeight: FontWeight.w400),),
                                                        ),
                            ],
                          ),
                        ),
                      ),
                   
                    ),
                 ),
                  SizedBox(height: 25,),
                 GestureDetector(
                  onTap: (){
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CivilBottomNav()),
                            );
                  },
                   child:
                   Expanded(
                      child: Container(
                          constraints: BoxConstraints(
                                                        minWidth: 500, minHeight: 100),
                                 
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            
                            children: [
                              CircleAvatar(
                                                backgroundImage:
                                                   AssetImage("Assets/civil.png"),
                                                radius: 30,
                                                backgroundColor:Colors.white,
                                                
                                              ),
                                                SizedBox(width: 10,),
                                                        Expanded(
                                                          child: Text("Civil Engineering", style: TextStyle(
                                                            color: Color.fromARGB(255, 160, 20, 184),fontSize: 25,fontWeight: FontWeight.w400),),
                                                        ),
                            ],
                          ),
                        ),
                      ),
                   
                    ),
                 ),
                  SizedBox(height: 25,),
                
                
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}