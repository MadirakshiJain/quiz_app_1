import 'package:flutter/material.dart';
import 'package:quiz/homepage.dart';
import 'package:quiz/optionsUI.dart';

import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  final String topic;

  const QuestionPage({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: 400,
                    padding: EdgeInsets.only(
                      left: 10,
                      bottom: 110,
                      right: 10,
                      top: 25,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 160, 20, 184),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context); // Go back to previous page
                            },
                            icon: Icon(Icons.arrow_back_ios, size: 20,),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            " $topic",
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 140,
                        ),
                        width: 350,
                        margin: EdgeInsets.only(top: 120, left: 20, right: 20),
                        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: Color(0xffA42FC1).withOpacity(.4),
                            )
                          ],
                        ),
                        child: Expanded(
                          child: Text(
                            "Question for $topic",
                            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: Center(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Color.fromARGB(255, 223, 150, 241),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Center(child: Text("10", style: TextStyle(color: Color(0xffA42FC1), fontSize: 28),)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 18),
                padding: EdgeInsets.all(15),
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: Color(0xffA42FC1)),
                ),
                child: Expanded(
                  child: Text("Option 1 for the question goes here."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                padding: EdgeInsets.all(15),
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: Color(0xffA42FC1)),
                ),
                child: Expanded(
                  child: Text("Option 2 for the question goes here."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                padding: EdgeInsets.all(15),
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: Color(0xffA42FC1)),
                ),
                child: Expanded(
                  child: Text("Option 3 for the question goes here."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                padding: EdgeInsets.all(15),
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: Color(0xffA42FC1)),
                ),
                child: Expanded(
                  child: Text("Option 4 for the question goes here."),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 160, 20, 184),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                  ),
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
