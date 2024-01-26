import 'package:flutter/material.dart';

class OptionUI extends StatelessWidget {
  const OptionUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
          children: [
            Container(
            margin: EdgeInsets.only(left:20,right: 20,bottom: 10,top: 18),
             padding: EdgeInsets.all(15),
            width:320 ,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3,color: ( Color(0xffA42FC1)))
            ),
            child: Expanded(
              child: Text("optiojcxlsdxjxlxzmlxmlzkmxlzmlmxmzxzmxzxhgccgncncgdggcn  ,nlkhkgjfhdhdmmgnvhvjhchchcvj"))),
            
              Container(
            margin: EdgeInsets.only(left:20,right: 20,bottom: 10),
             padding: EdgeInsets.all(15),
            width:320 ,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3,color: ( Color(0xffA42FC1)))
            ),
            child: Expanded(
              child: Text("optiojcxlsdxjxlxzmlxmlzkmxlzmlmxmzxzmxzxhgccgncncgdggcn  ,nlkhkgjfhdhdmmgnvhvjhchchcvj"))),
              Container(
            margin: EdgeInsets.only(left:20,right: 20,bottom: 10),
             padding: EdgeInsets.all(15),
            width:320 ,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3,color: ( Color(0xffA42FC1)))
            ),
            child: Expanded(
              child: Text("optiojcxlsdxjxlxzmlxmlzkmxlzmlmxmzxzmxzxhgccgncncgdggcn  ,nlkhkgjfhdhdmmgnvhvjhchchcvj"))),
              Container(
            margin: EdgeInsets.only(left:20,right: 20,bottom: 10),
             padding: EdgeInsets.all(15),
            width:320 ,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3,color: ( Color(0xffA42FC1)))
            ),
            child: Expanded(
              child: Text("optiojcxlsdxjxlxzmlxmlzkmxlzmlmxmzxzmxzxhgccgncncgdggcn  ,nlkhkgjfhdhdmmgnvhvjhchchcvj"))),
              
              ElevatedButton(
                                     style: ElevatedButton.styleFrom(primary:Color.fromARGB(255, 160, 20, 184),
                                     
                                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                                     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                     elevation: 5 ),
                                     onPressed: (){}, child: Container(
                                       alignment: Alignment.center,
                                       child: const Text("Next",style: TextStyle(fontSize: 20,
                                                          fontWeight: FontWeight.bold,color: Colors.white),),
                                     )),
          ],
        ),
      ),
    );
  }
}