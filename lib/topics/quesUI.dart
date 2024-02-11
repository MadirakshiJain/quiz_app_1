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
  late PageController _pageController;
  late List<Map<String, dynamic>>? questions;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    fetchQuestions();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> fetchQuestions() async {
    final selectedCategory =
        Provider.of<QuizState>(context, listen: false).selectedCategory;
    CollectionReference topicsRef =
        FirebaseFirestore.instance.collection('questions');

    QuerySnapshot<Map<String, dynamic>> snapshot = await topicsRef
        .doc(selectedCategory)
        .collection('topics')
        .doc(widget.topic)
        .collection('questions')
        .get();

    setState(() {
      questions = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: questions == null || questions!.isEmpty
          ? Center(child: Text('No questions available for this topic'))
          : Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios, size: 20),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                " ${widget.topic}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: questions!.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        blurRadius: 5,
                                        spreadRadius: 3,
                                        color: Color.fromARGB(255, 223, 150, 241).withOpacity(.4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    questions![index]['question'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ...List.generate(
                                  questions![index]['options'].length,
                                  (optionIndex) => GestureDetector(
                                    onTap: () {
                                      // Handle option selection
                                    },
                                    child: Container(
                                       constraints: BoxConstraints(minWidth: 350,minHeight: 50),
                                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(width: 3, color: Color(0xffA42FC1)),
                                      ),
                                      child: Text(questions![index]['options'][optionIndex]),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30), // Adjust the top padding to set the distance
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 160, 20, 184),
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                            ),
                            onPressed: () {
                              if (_currentPageIndex < questions!.length - 1) {
                                _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                              } else {
                                // Handle end of questions
                              }
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
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 140, // Adjust the top position according to your needs
                  left: 20,
                  right: 20,
                  child: Container(
                    constraints: BoxConstraints(minHeight: 140),
                    width: 350,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 3,
                          color: Color.fromARGB(255, 223, 150, 241).withOpacity(.4),
                        ),
                      ],
                    ),
                    child: Text(
                      questions![_currentPageIndex]['question'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: MediaQuery.of(context).size.width / 2 - 28,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Color.fromARGB(255, 223, 150, 241),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Text(
                          "${_currentPageIndex + 1}",
                          style: TextStyle(color: Color(0xffA42FC1), fontSize: 28),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
