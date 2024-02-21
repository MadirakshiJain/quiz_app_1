
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/que_widgets.dart/widgets/category.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';


class Add_Quiz extends StatefulWidget {
  const Add_Quiz({super.key});

  @override
  State<Add_Quiz> createState() => _Add_QuizState();
}

class _Add_QuizState extends State<Add_Quiz> {
  TextEditingController question_controller = new TextEditingController();
  TextEditingController option1_controller = new TextEditingController();
  TextEditingController option2_controller = new TextEditingController();
  TextEditingController option3_controller = new TextEditingController();
  TextEditingController option4_controller = new TextEditingController();
  TextEditingController correctAns_controller = new TextEditingController();
  TextEditingController Discription_controller =new TextEditingController();

  String selectedCategory = 'Computer Science';
  String? selectedSubcategory;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 20, 184),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
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
                            builder: (context) => Homepage(),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 20,),
                    ),
                  ),
                  SizedBox(width: 35,),
                  Text(
                    "ADD QUESTION",
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text("Question", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffececf8),
                  ),
                  child: TextField(
                    controller: question_controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Question",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 160, 147),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                  )),
              SizedBox(height: 20,),
              Text("Option-1", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffececf8),
                  ),
                  child: TextField(
                    controller: option1_controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Option-1",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 160, 147),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                  )),
              SizedBox(height: 20,),
              Text("Option-2", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffececf8),
                  ),
                  child: TextField(
                    controller: option2_controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Option-2",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 160, 147),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                  )),
              SizedBox(height: 20,),
              Text("Option-3", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffececf8),
                  ),
                  child: TextField(
                    controller: option3_controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Option-3",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 160, 147),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                  )),
              SizedBox(height: 20,),
              Text("Option-4", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffececf8),
                  ),
                  child: TextField(
                    controller: option4_controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Option-4",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 160, 147),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                  )),
              SizedBox(height: 20,),
              Text("Correct Answer", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffececf8),
                  ),
                  child: TextField(
                    controller: correctAns_controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Correct Answer",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 160, 147),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                  )),
              SizedBox(height: 20,),
               Text("Discription", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffececf8),
                  ),
                  child: TextField(
                    controller: Discription_controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Discription",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 160, 147),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                  )),
              SizedBox(height: 20,),
              Text("Branch", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              YourWidget(onCategorySelected: (category, subcategory) {
                var quizState = Provider
                    .of<QuizState>(context, listen: false);
                quizState.selectedCategory = category;
                quizState.selectedSubcategory = subcategory;
              },
              ),
              SizedBox(height: 40,),
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () async {
                      // Handle the button press
                      setState(() {
                        isLoading = true;
                      });
                      await addQuestion();
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text(
                          "ADD",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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

  Future<void> addQuestion() async {
    var quizState = Provider.of<QuizState>(context, listen: false);
    String question = question_controller.text;
    String option1 = option1_controller.text;
    String option2 = option2_controller.text;
    String option3 = option3_controller.text;
    String option4 = option4_controller.text;
    String correctAns = correctAns_controller.text;
    String Discription=Discription_controller.text;
    String category = quizState.selectedCategory;
    String topic = quizState.selectedSubcategory ?? "";

    CollectionReference questions =
    FirebaseFirestore.instance.collection('questions');

    DocumentReference categoryRef = questions.doc(category);
  DocumentReference topicRef = categoryRef.collection('topics').doc(topic);

  await topicRef.collection('questions').add({
    'question': question,
    'options': [option1, option2, option3, option4],
    'correctAnswer': correctAns,
    'iscription':Discription
  });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Question added successfully!"),
        duration: Duration(seconds: 2),
      ),
    );

    // Reset text controllers after adding the question
    question_controller.clear();
    option1_controller.clear();
    option2_controller.clear();
    option3_controller.clear();
    option4_controller.clear();
    correctAns_controller.clear();
    Discription_controller.clear();
  }
}
