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
  List<Map<String, dynamic>>? questions;
  int _currentPageIndex = 0;
  List<List<Color>> optionBorderColors = [];

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
    optionBorderColors = List.generate(questions!.length, (index) {
      return List<Color>.filled(
          questions![index]['options'].length, Color(0xffA42FC1));
    });
  });
}
 
void selectOption(int questionIndex, int selectedOptionIndex) {
  if (questions == null ||
      questions!.isEmpty ||
      questionIndex >= questions!.length) {
    // Ensure questions list is not null, empty, and index is within bounds
    return;
  }

  String selectedOptionValue =
      questions![questionIndex]['options'][selectedOptionIndex];

  // Debug print statements
  print('Selected Option Value: $selectedOptionValue');
  print('Correct Answer: ${questions![questionIndex]['correctAnswer']}');

  String correctAnswerValue = questions![questionIndex]['correctAnswer'];

  print('Correct Answer Value: $correctAnswerValue');

  if (selectedOptionIndex < 0 ||
      selectedOptionIndex >= questions![questionIndex]['options'].length) {
    // Ensure selected option index is within bounds
    return;
  }

  bool isCorrect = selectedOptionValue == correctAnswerValue;

  List<Color> updatedColors =
      List<Color>.from(optionBorderColors[questionIndex]);
  for (int i = 0; i < updatedColors.length; i++) {
    if (i == selectedOptionIndex && isCorrect) {
      updatedColors[i] = Colors.green; // Green for correct selected option
    } else if (i == selectedOptionIndex && !isCorrect) {
      updatedColors[i] = Colors.red; // Red for incorrect selected option
    } else if (questions![questionIndex]['options'][i] == correctAnswerValue) {
      updatedColors[i] = Colors.green; // Green for correct option
    }
  }

  // Update state with new border colors
  setState(() {
    optionBorderColors[questionIndex] = updatedColors;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar(
        toolbarHeight: 140,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 160, 20, 184),
        automaticallyImplyLeading: false, // Remove the back arrow
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
                      Navigator.pop(context); // Go to previous screen
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
          ? Center(child: CircularProgressIndicator()) // Show loader when questions are loading
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all(
                                                      width: 3,
                                                      color: optionBorderColors[index][optionIndex]),
                                                ),
                                                child: Text(questions![index]
                                                    ['options'][optionIndex]),
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
                                            primary: Color.fromARGB(
                                                255, 160, 20, 184),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 12),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 5,
                                          ),
                                          onPressed: () {
                                            if (_currentPageIndex <
                                                questions!.length - 1) {
                                              _pageController.nextPage(
                                                  duration:
                                                      Duration(milliseconds: 500),
                                                  curve: Curves.ease);
                                            } else {
                                              // Handle end of questions
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
                                            onPressed: () {},
                                            child: Text(
                                              "View Description",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 160, 20, 184),
                                              ),
                                            )),
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
}
