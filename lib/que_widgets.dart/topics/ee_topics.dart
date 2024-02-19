import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/category.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';
import 'package:quiz/que_widgets.dart/homepage/ee_home.dart';
import 'package:quiz/screens.dart/que.dart';

class Ee_Topics extends StatelessWidget {
  const Ee_Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 20, 184),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ee_Home(),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 20,),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Electrical Engineering",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              buildTopicContainer(context, "Electric Circuits"),
              buildTopicContainer(context, "Electromagnetic Fields"),
              buildTopicContainer(context, "Signals and Systems"),
              buildTopicContainer(context, "Electrical Machines"),
              buildTopicContainer(context, "Power Systems"),
              buildTopicContainer(context, "Control Systems"),
              buildTopicContainer(context, "Electrical and Electronic Measurements"),
              buildTopicContainer(context, "Analog and Digital Electronics"),
              buildTopicContainer(context, "Power Electronics"),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopicContainer(BuildContext context, String topic) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionPage(topic: topic,),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 18),
        padding: EdgeInsets.all(15),
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Text(
          topic,
          style: TextStyle(color: Color.fromARGB(255, 160, 20, 184), fontSize: 18,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
