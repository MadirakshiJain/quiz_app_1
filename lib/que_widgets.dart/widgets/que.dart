import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/que_widgets.dart/widgets/category.dart';

import 'package:quiz/que_widgets.dart/widgets/result.dart';

import 'package:shared_preferences/shared_preferences.dart';

class QuestionPage extends StatefulWidget {
  final String topic;

  const QuestionPage({Key? key, required this.topic}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late PageController _pageController;
  List<Map<String, dynamic>>? questions;
  int _currentPageIndex = 0;
  List<List<Color>> optionBorderColors = [];
  List<bool> answerResults = [];

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

  void _showDescriptionDialog(String? description) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Question Description'),
        content: Text(description ?? 'No description available'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
  Future<void> fetchQuestions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedQuestionsKey = 'cached_questions_${widget.topic}';

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

    List<Map<String, dynamic>> fetchedQuestions =
        snapshot.docs.map((doc) => doc.data()).toList();

    setState(() {
      questions = fetchedQuestions;
      optionBorderColors = List.generate(
        questions!.length,
        (index) => List<Color>.filled(
          questions![index]['options'].length,
          Color(0xffA42FC1),
        ),
      );
      answerResults = List<bool>.filled(questions!.length, false);
    });

    // Cache fetched questions
    prefs.setString(cachedQuestionsKey, json.encode(fetchedQuestions));
  }

  void selectOption(int questionIndex, int selectedOptionIndex) {
    if (questions == null ||
        questions!.isEmpty ||
        questionIndex >= questions!.length) {
      return;
    }

    String selectedOptionValue =
        questions![questionIndex]['options'][selectedOptionIndex];

    String correctAnswerValue = questions![questionIndex]['correctAnswer'];
    bool isCorrect = selectedOptionValue == correctAnswerValue;
    answerResults[questionIndex] = isCorrect;
    setState(() {
      // Reset all option colors to default
      optionBorderColors[questionIndex] =
          List<Color>.filled(questions![questionIndex]['options'].length, Color(0xffA42FC1));

      // Update the color of the selected option based on correctness
      if (isCorrect) {
        optionBorderColors[questionIndex][selectedOptionIndex] = Colors.green;
      } else {
        optionBorderColors[questionIndex][selectedOptionIndex] = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 160, 20, 184),
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    if (_currentPageIndex > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 20),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        widget.topic,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CircleAvatar(
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
          ],
        ),
      ),
      body: questions == null
          ? Center(child: CircularProgressIndicator())
          : questions!.isEmpty
              ? Center(child: Text('No questions available for this topic'))
              : Stack(
                  children: [
                    Positioned.fill(
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: questions!.length,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPageIndex = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Container(
                                        constraints: BoxConstraints(
                                            minHeight: 100, minWidth: 350),
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 1),
                                              blurRadius: 5,
                                              spreadRadius: 3,
                                              color: Color.fromARGB(
                                                      255, 220, 126, 243)
                                                  .withOpacity(.4),
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
                                      Column(
                                        children: List.generate(
                                          questions![index]['options'].length,
                                          (optionIndex) {
                                            return GestureDetector(
                                              onTap: () {
                                                selectOption(index, optionIndex);
                                              },
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    minWidth: 350, minHeight: 50),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 10),
                                                padding: EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(
                                                      width: 3,
                                                      color: optionBorderColors[index][optionIndex]),
                                                ),
                                                child: Text(
                                                    questions![index]['options'][optionIndex]),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 10, left: 20, right: 20),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 160, 20, 184),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 12),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)),
                                            elevation: 5,
                                          ),
                                          onPressed: () {
                                            if (_currentPageIndex < questions!.length - 1) {
                                              _pageController.nextPage(
                                                  duration: Duration(milliseconds: 500),
                                                  curve: Curves.ease);
                                            } else {
                                              int totalQuestions = questions!.length;
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => ResultPage(
                                                  totalQuestions: questions!.length,
                                                  correctAnswers: calculateCorrectAnswers(),
                                                  incorrectAnswers: totalQuestions - calculateCorrectAnswers(),
                                                  answerResults: calculateAnswerResults(),
                                                   selectedCategory:Provider.of<QuizState>(context, listen: false).selectedCategory, 
                                                ),
                                              ));
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "Next",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            _showDescriptionDialog(questions![index]['description']);

                                          },
                                          child: Text(
                                            "View Description",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 160, 20, 184),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20)
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }

  int calculateCorrectAnswers() {
    int count = 0;
    for (int i = 0; i < questions!.length; i++) {
      if (optionBorderColors[i].contains(Colors.green)) {
        count++;
      }
    }
    return count;
  }

  List<bool> calculateAnswerResults() {
    List<bool> results = [];
    if (questions == null || optionBorderColors.isEmpty) {
      return results; // Return an empty list if questions or optionBorderColors is null or empty
    }
    for (int i = 0; i < questions!.length; i++) {
      // Check if the optionBorderColors for the question contains Colors.green
      bool isCorrect = optionBorderColors[i].contains(Colors.green);
      results.add(isCorrect);
    }
    return results;
  }
}
