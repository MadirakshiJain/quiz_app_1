import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:quiz/que_widgets.dart/category.dart';
import 'package:quiz/que_widgets.dart/result.dart';

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
    // Manually initialize questions list with your desired questions
    initializeQuestions();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void initializeQuestions() {
    // Define your questions here
    // Each question is represented as a Map<String, dynamic>
    questions = 
    [
        {
            "question": "A man starts from point A to point B at 10:00 AM and reaches at 11:00 AM. Then he returns back and starts from point B at 11:30 AM and reaches point A at 12:30 PM. Find the total distance covered by the man.",
            "options": [
                "10 km",
                "20 km",
                "30 km",
                "40 km"
            ],
            "correctAnswer": "20 km",
           // "explanation": "The man covers 10 km from point A to point B and then 10 km from point B to point A again, so the total distance covered is 20 km."
        },
        {
            "question": "Find the missing term in the series: 2, 5, 10, 17, 26, ___, 47",
            "options": [
                "35",
                "37",
                "39",
                "41"
            ],
            "correctAnswer": "37",
           // "explanation": "The series follows the pattern: add 3, multiply by 2, add 3, multiply by 2, and so on."
        },
        {
            "question": "Find the odd one out: apple, banana, orange, mango, strawberry",
            "options": [
                "Apple",
                "Banana",
                "Strawberry",
                "Mango"
            ],
            "correctAnswer": "Strawberry",
           // "explanation": "Strawberry is the odd one out because it is the only fruit that produces seeds on the outside of its fruit."
        },
        {
            "question": "A train leaves Delhi at 10:00 AM and travels at a speed of 60 km/hr. Another train leaves Mumbai at 11:00 AM and travels at a speed of 80 km/hr. If the distance between Delhi and Mumbai is 960 km, at what time will the two trains meet?",
            "options": [
                "1:00 PM",
                "2:00 PM",
                "3:00 PM",
                "4:00 PM"
            ],
            "correctAnswer": "3:00 PM",
           // "explanation": "The first train travels for 1 hour before the second train leaves. So, it covers a distance of 60 km. The remaining distance to be covered is 960 km - 60 km = 900 km. The two trains will meet after 900 km / (60 km/hr + 80 km/hr) = 3 hours."
        },
        {
            "question": "Find the next term in the series: 1, 4, 9, 16, 25",
            "options": [
                "36",
                "49",
                "64",
                "81"
            ],
            "correctAnswer": "36",
           // "explanation": "The series follows the pattern: square of consecutive natural numbers."
        },
        {
            "question": "A clock strikes once at 1:00 PM, twice at 2:00 PM, three times at 3:00 PM, and so on. How many times will it strike in a 24-hour period?",
            "options": [
                "120",
                "156",
                "180",
                "240"
            ],
            "correctAnswer": "156",
           // "explanation": "The clock will strike 12 times for the 12 hours from 1:00 PM to 12:00 AM, and it will strike 144 times for the 12 hours from 1:00 AM to 12:00 PM. So, it will strike a total of 12 + 144 = 156 times in a 24-hour period."
        },
        {
            "question": "Find the sum of the first 10 natural numbers.",
            "options": [
                "45",
                "50",
                "55",
                "60"
            ],
            "correctAnswer": "55",
           // "explanation": "The sum of the first n natural numbers is n(n+1)/2. So, the sum of the first 10 natural numbers is 10(10+1)/2 = 55."
        },
        {
            "question": "Find the product of the first 5 prime numbers.",
            "options": [
                "210",
                "2310",
                "3025",
                "3250"
            ],
            "correctAnswer": "2310",
           // "explanation": "The first 5 prime numbers are 2, 3, 5, 7, and 11. So, the product of the first 5 prime numbers is 2 * 3 * 5 * 7 * 11 = 2310."
        },
        {
            "question": "Find the greatest common divisor (GCD) of 12 and 18.",
            "options": [
                "4",
                "6",
                "12",
                "18"
            ],
            "correctAnswer": "6",
           // "explanation": "The GCD of two numbers is the largest number that divides both numbers without leaving a remainder. The GCD of 12 and 18 is 6."
        },
        {
            "question": "Find the least common multiple (LCM) of 6 and 9.",
            "options": [
                "12",
                "18",
                "24",
                "36"
            ],
            "correctAnswer": "18",
           // "explanation": "The LCM of two numbers is the smallest number that is divisible by both numbers. The LCM of 6 and 9 is 18."
        },
        {
            "question": "Find the area of a circle with a radius of 5 cm.",
            "options": [
                "25\u03c0 cm^2",
                "50\u03c0 cm^2",
                "75\u03c0 cm^2",
                "100\u03c0 cm^2"
            ],
            "correctAnswer": "25\u03c0 cm^2",
            //"explanation": "The area of a circle is given by \u03c0r^2. So, the area of a circle with a radius of 5 cm is \u03c0 * 5^2 = 25\u03c0 cm^2."
        },
        {
            "question": "Find the volume of a cube with a side length of 4 cm.",
            "options": [
                "16 cm^3",
                "64 cm^3",
                "256 cm^3",
                "1024 cm^3"
            ],
            "correctAnswer": "64 cm^3",
            // "explanation": "The volume of a cube is given by s^3. So, the volume of a cube with a side length of 4 cm is 4^3 = 64 cm^3."
        },
        {
            "question": "Find the surface area of a sphere with a radius of 3 cm.",
            "options": [
                "12\u03c0 cm^2",
                "27\u03c0 cm^2",
                "36\u03c0 cm^2",
                "108\u03c0 cm^2"
            ],
            "correctAnswer": "36\u03c0 cm^2",
           // "explanation": "The surface area of a sphere is given by 4\u03c0r^2. So, the surface area of a sphere with a radius of 3 cm is 4\u03c0 * 3^2 = 36\u03c0 cm^2."
        },
        {
            "question": "Find the derivative of the function f(x) = x^2.",
            "options": [
                "x",
                "2x",
                "x^2",
                "2x^2"
            ],
            "correctAnswer": "2x",
           // "explanation": "The derivative of f(x) = x^n is nx^(n-1). So, the derivative of f(x) = x^2 is 2x^1 = 2x."
        },
        {
            "question": "Find the integral of the function f(x) = sin(x).",
            "options": [
                "cos(x)",
                "-cos(x)",
                "sin(x)",
                "-sin(x)"
            ],
            "correctAnswer": "-cos(x)",
          //  "explanation": "The integral of f(x) = sin(x) is -cos(x)."
        }
    ];


    // Initialize option border colors and answer results
    optionBorderColors = List.generate(
      questions!.length,
      (index) => List<Color>.filled(questions![index]['options'].length, Color(0xffA42FC1)),
    );
    answerResults = List<bool>.filled(questions!.length, false);
  }
   
  void selectOption(int questionIndex, int selectedOptionIndex) {
    if (questions == null ||
        questions!.isEmpty ||
        questionIndex >= questions!.length) {
      // Ensure questions list is not null, empty, and index is within bounds
      return;
    }

    String selectedOptionValue = questions![questionIndex]['options'][selectedOptionIndex];
    String correctAnswerValue = questions![questionIndex]['correctAnswer'];

    // Check if the selected option is correct
    bool isCorrect = selectedOptionValue == correctAnswerValue;

    // Update the list of answer results
    answerResults[questionIndex] = isCorrect;

    // Update the UI to reflect the user's selection
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
                                                255,
                                                220,
                                                126,
                                                243,
                                              ).withOpacity(.4),
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
                                                  minWidth: 350,
                                                  minHeight: 50,
                                                ),
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 10,
                                                ),
                                                padding: EdgeInsets.all(15),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(
                                                    width: 3,
                                                    color:
                                                        optionBorderColors[index][optionIndex],
                                                  ),
                                                ),
                                                child: Text(
                                                  questions![index]['options'][optionIndex],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 30,
                                          bottom: 10,
                                          left: 20,
                                          right: 20,
                                        ),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(255, 160, 20, 184),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            elevation: 5,
                                          ),
                                          onPressed: () {
                                            if (_currentPageIndex < questions!.length - 1) {
                                              _pageController.nextPage(
                                                duration: Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                            } else {
                                              int totalQuestions = questions!.length;
                                              // Navigate to the ResultPage when the last question is reached
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) => ResultPage(
                                                    totalQuestions: questions!.length,
                                                    correctAnswers: calculateCorrectAnswers(),
                                                    incorrectAnswers: totalQuestions -
                                                        calculateCorrectAnswers(),
                                                    answerResults: calculateAnswerResults(),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "Next",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
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
                                              color: Color.fromARGB(255, 160, 20, 184),
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
