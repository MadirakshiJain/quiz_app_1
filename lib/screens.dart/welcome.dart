import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/branches/branches.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';

 
class WelcomeScreen extends StatelessWidget{
@override
Widget build(BuildContext context) {
    return Material(
      child: Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height ,
        child:Stack(
          children:[
            Stack(children: [
              Container(
                width:MediaQuery.of(context).size.width,
               height:MediaQuery.of(context).size.height/1.6,
                decoration:BoxDecoration(
                  color:Colors.white,
                ),
              ),
               Container(
                width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height/1.4,
                decoration:BoxDecoration(
                  color:Color.fromARGB(255, 160, 20, 184),
                  borderRadius: 
                       BorderRadius.only(bottomRight:Radius.circular(70)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset("Assets/education-concept-with-cartoon-learning-reading-vector-34983031-removebg-preview (1).png",
                ),
              ),
              ),
            ],
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child:Container(
              width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height/2.666,
                decoration:BoxDecoration(
                   color: Color.fromARGB(255, 160, 20, 184),
                ),
            ),
          ),
              Align(
            alignment: Alignment.bottomCenter,
            child:Container(
              width:MediaQuery.of(context).size.width,
              height: 320,
                //height:MediaQuery.of(context).size.height/2.666,
                padding: EdgeInsets.only(top:40,),
                decoration:BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                   ),
                ),
                child: Column(children:[
                      Text("WELCOME !",
                       style:TextStyle(
                         fontSize:25,
                         fontWeight:FontWeight.w600,
                         letterSpacing:1,
                         wordSpacing:2,
                  ),
                ),
                  SizedBox(height: 10),
                  Padding
                  (padding:EdgeInsets.symmetric(horizontal:40,vertical: 15),
                  child: Text(
                    "Learning with pleasure with Dear Programmer,Wherever you are.",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize:17,
                      color:Colors.black.withOpacity(0.6),
                      ),
                  ),
                  ),
                   SizedBox(height: 20),
                  Material( 
                    color:Color.fromARGB(255, 160, 20, 184),
                    borderRadius: BorderRadius.circular(10),
                    child:InkWell( 
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute
                          (
                          builder:(context) => Branches(),
                        ));
                      },
                      child: Container( 
                        padding:EdgeInsets.symmetric( 
                          vertical: 15,horizontal: 40),
                        child:Text( 
                          "Register ",
                            style:TextStyle(

                          color:Colors.white,
                          fontSize: 22,
                          fontWeight:FontWeight.bold,
                          letterSpacing: 1,
                            ),
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text("Already Registered ? ",style: TextStyle(fontSize: 18),),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color:Color.fromARGB(255, 160, 20, 184),
                              fontSize: 18),
                        ),
                      )
                    ],
                  ),

                ],
                ),
            ),
              ),
          ],
        ),
      ),
      );
    
  }
}