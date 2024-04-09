import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/widgets/branches.dart';


 
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
              child: Center(
                
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50,),
                   Text("  EngiQuest", style:TextStyle(
                         fontSize:25,
                         fontWeight:FontWeight.bold,
                         fontStyle: FontStyle.italic,
                         color: Colors.white,
                         letterSpacing:1,
                         wordSpacing:2,
                                     ),),
                  //  SizedBox(height: 20,),
                   Image.asset("Assets/welcome.png",
                      height: 270,
                      ),
                  ],
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
               height: 350,
               
                padding: EdgeInsets.only(top:40,),
                decoration:BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                   ),
                ),
                child: Column(
                  
                  children:[
                  SizedBox(
                    height: 5,
                  ),
                      Text(" WELCOME   TO ",
                       style:TextStyle(
                         fontSize:25,
                         fontStyle: FontStyle.italic,
                         fontWeight:FontWeight.w600,
                     color:    Color.fromARGB(255, 131, 7, 153),
                         letterSpacing:1,
                         wordSpacing:2,
                  ),
                ),
                // SizedBox(
                //     height: 10,
                //   ),
                      Text("  ENGIQUEST !",
                       style:TextStyle(
                         fontSize:25,
                         fontStyle: FontStyle.italic,
                         fontWeight:FontWeight.w600,
                     color:    Color.fromARGB(255, 131, 7, 153),
                         letterSpacing:1,
                         wordSpacing:2,
                  ),
                ),
                  SizedBox(height: 20),
                  Padding
                  (padding:EdgeInsets.symmetric(horizontal:40,vertical: 15),
                  child: Text(
                   "Get Ready to Play, Learn, and Conquer – Welcome to the Quiz Universe!",
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize:18,
                      color:Colors.black.withOpacity(0.6),
                      ),
                  ),
                  ),
                   SizedBox(height: 18),
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
                          "Get  Started ",
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