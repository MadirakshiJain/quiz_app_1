import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/widgets/category.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';
import 'package:quiz/que_widgets.dart/widgets/que.dart';
//import 'package:your_app_path/question_page.dart';

class Cse_Topics extends StatelessWidget {
  const Cse_Topics({Key? key});

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
                      "Computer Science & Information Technology",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              buildTopicContainer(context, "Engineering Mathematics"),
              buildTopicContainer(context, "Digital Logic"),
              buildTopicContainer(context, "Computer Organization & Architecture"),
              buildTopicContainer(context, "Programming and Data Structure"),
              buildTopicContainer(context, "Algorithms"),
              buildTopicContainer(context, "Theory of Computation"),
              buildTopicContainer(context, "Compiler Design"),
              buildTopicContainer(context, "Operating System"),
              buildTopicContainer(context, "Databases"),
              buildTopicContainer(context, "Computer Networks"),
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
            builder: (context) => QuestionPage(topic: topic, ),
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
