import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/category.dart';

class QuestionPage extends StatefulWidget {
  final String topic;

  const QuestionPage({Key? key, required this.topic}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchQuestions(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Map<String, dynamic>> questions = snapshot.data!;
          return _buildQuestionPage(questions);
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> fetchQuestions(BuildContext context) async {
    final selectedCategory = Provider.of<QuizState>(context, listen: false).selectedCategory;
    CollectionReference topicsRef = FirebaseFirestore.instance.collection('questions');

    QuerySnapshot<Map<String, dynamic>> snapshot = await topicsRef
        .doc(selectedCategory)
        .collection('topics')
        .doc(widget.topic)
        .collection('questions')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Widget _buildQuestionPage(List<Map<String, dynamic>> questions) {
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
                            " ${widget.topic}",
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
                        child: StreamBuilder<List<Map<String, dynamic>>>(
                          stream: fetchQuestions(context).asStream(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                               String question = snapshot.data?[0]['question'] ?? '';
                              return Text(
                                question,
                                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Text('Loading...');
                            }
                          },
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
                              child: Center(child: Text(" ${1} ", style: TextStyle(color: Color(0xffA42FC1), fontSize: 28),)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              StreamBuilder<List<Map<String, dynamic>>>(
                stream: fetchQuestions(context).asStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<String> options = List<String>.from(snapshot.data![0]['options']);
                    return Column(
                      children: options.map((option) {
                        return Container(
                          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          padding: EdgeInsets.all(15),
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 3, color: Color(0xffA42FC1)),
                          ),
                          child: Text(option),
                        );
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Loading...');
                  }
                },
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
                  onPressed: () {
                   setState(() {
                        
                    });
                  },
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
