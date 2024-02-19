import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';

class ResultPage extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final int incorrectAnswers;
  final List<bool> answerResults;

  ResultPage({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.answerResults,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate percentage
    double percentage = (correctAnswers / totalQuestions) * 100;

    // Ensure there are no zero values in the pie chart data
    double correctAnswersValue = correctAnswers.toDouble();
    double incorrectAnswersValue = incorrectAnswers.toDouble();

    // If all answers are correct or all answers are incorrect,
    // set both values to 1 to avoid zero values in the pie chart
    if (correctAnswers == totalQuestions && incorrectAnswers == 0) {
      incorrectAnswersValue = 1;
    } else if (correctAnswers == 0 && incorrectAnswers == totalQuestions) {
      correctAnswersValue = 1;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 160, 20, 184),
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Center(
              child: Expanded(
                child: Text(
                  "Your  score",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        if (correctAnswersValue > 0)
                          PieChartSectionData(
                            title: correctAnswers.toString(),
                            color: Colors.green,
                            value: correctAnswersValue,
                          ),
                        if (incorrectAnswersValue > 0)
                          PieChartSectionData(
                            title: incorrectAnswers.toString(),
                            color: Colors.red,
                            value: incorrectAnswersValue,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              // Total questions
              Text(
                'Total Questions: $totalQuestions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 150, 15, 184),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Correct Answers: $correctAnswers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 150, 15, 184),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Incorrect Answers: $incorrectAnswers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 150, 15, 184),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Percentage: ${percentage.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 150, 15, 184),
                ),
              ),
              SizedBox(height: 70),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ),
                    );
                  },
                  child: Text(
                    "Back to Homepage",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
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
