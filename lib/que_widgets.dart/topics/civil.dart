// civil_topics.dart

import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/homepage/civil_home.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';
import 'package:quiz/que_widgets.dart/widgets/que.dart';
 // Update with the correct path

class Civil_Topics extends StatelessWidget {
  const Civil_Topics({Key? key});

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
                      onPressed: () {
                        Navigator.of(context).pop(); // Navigate back to previous page
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Civil Engineering",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              buildTopicContainer(context, "Engineering Mathematics"),
              buildTopicContainer(context, "Structural Engineering"),
              buildTopicContainer(context, "Geotechnical Engineering"),
              buildTopicContainer(context, "Water Resources Engineering"),
              buildTopicContainer(context, "Environment Engineering"),
              buildTopicContainer(context, "Transportation Engineering"),
              buildTopicContainer(context, "Geomatics Engineering"),
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
            builder: (context) => QuestionPage(topic: topic),
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
          style: TextStyle(color: Color.fromARGB(255, 160, 20, 184), fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
