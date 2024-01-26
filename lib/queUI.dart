import 'package:flutter/material.dart';

class QueUI extends StatefulWidget {

  const QueUI({super.key});

  @override
  State<QueUI> createState() => _QueUIState();
}

class _QueUIState extends State<QueUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
           children: [
              Container(
          
                // color: Colors.amber,
                height: 715,
          
                 child: Expanded(
                   child: Stack(
                     children: [
                       Container(
                        margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                              height: 200,
                              width: 390,
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 160, 20, 184),
                                borderRadius: BorderRadius.circular(20)
                              ), ),
                            Positioned(
                              bottom: 670,
                              left: 30,
                              right: 15,
                              child: Text("Topic Name",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
                             Positioned(
                        bottom:410,
                         left: 12,
                         right: 12,
                        child:
                         Container(
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(15),
                          height: 160,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: Color(0xffA42FC1).withOpacity(.4)
                            )]
                          ),
                          
                          child: Text("question",style: TextStyle(fontSize: 18),)
                        ),
                        
                        ),
                        Positioned(
                        bottom: 560,
                          left: 150,
                          child:
                           CircleAvatar(
                            radius:28,
                            backgroundColor:Color.fromARGB(255, 223, 150, 241) ,
                            child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Center(child: Text("10",style: TextStyle(color: Color(0xffA42FC1),fontSize: 28),)),
                                              ),
                          )),
                          Positioned(
                            //bottom: 100,
                            top: 320,
                            child:Column(
                                                      children: [
                                                         Options(option: "option A"),
                                       Options(option: "option B"),
                                       Options(option: "option C"),
                                        Options(option: "option D"),
                                                     Positioned(
                                                      top: 650,
                                                     // bottom: 30,
                                                      left: 20,
                                                      child: SizedBox(
                                                        width: 320,
                                                        child: ElevatedButton(
                                     style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 160, 20, 184),
                                     
                                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                                     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                     elevation: 5 ),
                                     onPressed: (){}, child: Container(
                                       alignment: Alignment.center,
                                       child: const Text("Next",style: TextStyle(fontSize: 20,
                                                          fontWeight: FontWeight.bold,color: Colors.white),),
                                     )),
                                                      ),)
                                                      ],
                                                    )
                          ),
                        //  Positioned(
                        //     top: 650,
                        //    // bottom: 30,
                        //     left: 20,
                        //     child: SizedBox(
                        //       width: 320,
                        //       child: ElevatedButton(
                        //                   style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 160, 20, 184),
                                          
                        //                   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                        //                   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        //                   elevation: 5 ),
                        //                   onPressed: (){}, child: Container(
                        //                     alignment: Alignment.center,
                        //                     child: const Text("Next",style: TextStyle(fontSize: 20,
                        //         fontWeight: FontWeight.bold,color: Colors.white),),
                        //                   )),
                        //     ),)
                     ],
                   ),
                 ),
              
               ),
            ]
          ),
        ),
      ),
    );
 
  }
}


class Options extends StatelessWidget {
 
   Options({Key ? key, required String option,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(left:20,right: 20,bottom: 15),
            
            padding: EdgeInsets.all(15),
            width:320 ,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3,color: ( Color(0xffA42FC1)))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child:
                 Text("optiojcxlsdxjxlxzmlxmlzkmxlzmlmxmzxzmxzxhgccgncncgdggcn  ,nlkhkgjfhdhdmmgnvhvjhchchcvj")),
             ],
            )),
        ),
         
          
                                  
      ]
       
                     
    );
     
                    
  }
}