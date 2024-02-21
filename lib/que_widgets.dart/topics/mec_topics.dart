import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';
import 'package:quiz/que_widgets.dart/homepage/mec_home.dart';
import 'package:quiz/que_widgets.dart/widgets/que.dart';

class Mec_Topics extends StatelessWidget {
  const Mec_Topics({super.key});

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
                    child:IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Navigate back to previous page
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Mechanical Engineering",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              buildTopicContainer(context, "Engineering Mathematics"),
              buildTopicContainer(context, "Applied Mechanics and Design"),
              buildTopicContainer(context, "Fluid Mechanics and Thermal Science"),
              buildTopicContainer(context, "Materials, Manufacturing and Industrial Engineering"),
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
          style: TextStyle(color: Color.fromARGB(255, 160, 20, 184), fontSize: 18,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
