import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:quiz/que_widgets.dart/category.dart';
import 'package:quiz/que_widgets.dart/result.dart';

class TestPage extends StatefulWidget {
  
  const TestPage({Key? key, }) : super(key: key);

  @override
  State<TestPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<TestPage> {
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
        "question": "What is the time complexity of merge sort algorithm?",
        "options": [
            "O(n)",
            "O(n log n)",
            "O(n^2)",
            "O(log n)"
        ],
        "correctAnswer": "O(n log n)",
        "explanation": "Merge sort has a time complexity of O(n log n) in all cases, making it efficient for large datasets."
    },
    {
        "question": "What is the purpose of dynamic programming in algorithms?",
        "options": [
            "To optimize recursive algorithms",
            "To reduce the time complexity of algorithms",
            "To minimize the number of function calls",
            "To allocate memory dynamically"
        ],
        "correctAnswer": "To optimize recursive algorithms",
        "explanation": "Dynamic programming is a method for solving complex problems by breaking them down into simpler subproblems."
    },
    {
        "question": "What is the primary advantage of using a linked list over an array?",
        "options": [
            "Constant-time access to elements",
            "Better cache locality",
            "Dynamic size allocation",
            "Efficient memory utilization"
        ],
        "correctAnswer": "Dynamic size allocation",
        "explanation": "Linked lists allow for efficient insertion and deletion of elements at any position, without requiring contiguous memory allocation."
    },
    {
        "question": "Which data structure is typically used to implement a priority queue?",
        "options": [
            "Array",
            "Linked list",
            "Heap",
            "Stack"
        ],
        "correctAnswer": "Heap",
        "explanation": "A heap data structure is commonly used to implement a priority queue due to its efficient insertion and removal of the highest (or lowest) priority element."
    },
    {
        "question": "What is the time complexity of binary search algorithm?",
        "options": [
            "O(n)",
            "O(log n)",
            "O(n log n)",
            "O(n^2)"
        ],
        "correctAnswer": "O(log n)",
        "explanation": "Binary search has a time complexity of O(log n), as it halves the search space in each step."
    },
    {
        "question": "What is the main difference between breadth-first search (BFS) and depth-first search (DFS) algorithms?",
        "options": [
            "BFS uses a stack data structure, while DFS uses a queue",
            "BFS explores vertices one level at a time, while DFS explores vertices as far as possible along each branch",
            "BFS has lower time complexity than DFS",
            "DFS guarantees finding the shortest path between two vertices"
        ],
        "correctAnswer": "BFS explores vertices one level at a time, while DFS explores vertices as far as possible along each branch",
        "explanation": "BFS systematically explores vertices level by level, while DFS explores as far as possible along each branch before backtracking."
    },
    {
        "question": "What is the purpose of Big O notation in computer science?",
        "options": [
            "To represent the upper bound of an algorithm's time complexity",
            "To measure the actual running time of an algorithm",
            "To analyze the average-case performance of an algorithm",
            "To represent the best-case scenario of an algorithm"
        ],
        "correctAnswer": "To represent the upper bound of an algorithm's time complexity",
        "explanation": "Big O notation is used to represent the worst-case time complexity of an algorithm, providing an upper bound on its running time."
    },
    {
        "question": "What is the time complexity of inserting an element into a binary search tree (BST) with n nodes?",
        "options": [
            "O(1)",
            "O(log n)",
            "O(n)",
            "O(n log n)"
        ],
        "correctAnswer": "O(log n)",
        "explanation": "Inserting an element into a BST requires traversing the tree from the root to the appropriate leaf node, which takes O(log n) time on average for a balanced tree."
    },
    {
        "question": "Which sorting algorithm has the best time complexity in the worst-case scenario?",
        "options": [
            "Merge sort",
            "Quick sort",
            "Insertion sort",
            "Bubble sort"
        ],
        "correctAnswer": "Merge sort",
        "explanation": "Merge sort has a time complexity of O(n log n) in all cases, making it efficient for worst-case scenarios."
    },
    {
        "question": "What is the purpose of a hash table?",
        "options": [
            "To store data in sorted order",
            "To provide constant-time access to elements",
            "To allocate memory dynamically",
            "To efficiently implement associative arrays"
        ],
        "correctAnswer": "To efficiently implement associative arrays",
        "explanation": "A hash table is a data structure that maps keys to values, providing efficient insertion, deletion, and lookup operations."
    },
    {
        "question": "What is the time complexity of finding the shortest path between two vertices in a weighted graph using Dijkstra's algorithm?",
        "options": [
            "O(V)",
            "O(E)",
            "O(V log V)",
            "O(V^2)"
        ],
        "correctAnswer": "O(V^2)",
        "explanation": "Dijkstra's algorithm has a time complexity of O(V^2) when using an adjacency matrix representation of the graph."
    },
    {
        "question": "What is the main advantage of using an AVL tree over a binary search tree (BST)?",
        "options": [
            "AVL trees have a simpler insertion operation",
            "AVL trees have faster search operations",
            "AVL trees guarantee balanced height, ensuring O(log n) operations",
            "AVL trees require less memory allocation"
        ],
        "correctAnswer": "AVL trees guarantee balanced height, ensuring O(log n) operations",
        "explanation": "AVL trees maintain balanced height, which ensures that operations such as insertion, deletion, and search have O(log n) time complexity."
    },
    {
        "question": "What is the primary purpose of a cache memory in computer architecture?",
        "options": [
            "To store frequently accessed data for fast retrieval",
            "To increase the clock speed of the CPU",
            "To provide additional storage space for programs",
            "To enhance the security of the system"
        ],
        "correctAnswer": "To store frequently accessed data for fast retrieval",
        "explanation": "Cache memory is used to temporarily store frequently accessed data and instructions, reducing the average time to access memory."
    },
    {
        "question": "What is the time complexity of the Floyd-Warshall algorithm for finding all shortest paths in a weighted graph?",
        "options": [
            "O(V)",
            "O(E)",
            "O(V log V)",
            "O(V^3)"
        ],
        "correctAnswer": "O(V^3)",
        "explanation": "The Floyd-Warshall algorithm has a time complexity of O(V^3) due to its triple nested loops."
    },
    {
        "question": "What is the main difference between a stack and a queue data structure?",
        "options": [
            "Stack allows only sequential access, while queue allows random access",
            "Stack follows LIFO (Last In, First Out) principle, while queue follows FIFO (First In, First Out) principle",
            "Stack has lower time complexity than queue",
            "Stack can hold a variable number of elements, while queue has a fixed size"
        ],
        "correctAnswer": "Stack follows LIFO (Last In, First Out) principle, while queue follows FIFO (First In, First Out) principle",
        "explanation": "Stack allows elements to be inserted and removed from only one end, while queue allows elements to be inserted at the rear and removed from the front."
    },
    {
        "question": "What is the primary use case of the A* search algorithm?",
        "options": [
            "Pathfinding in games and robotics",
            "Sorting elements in an array",
            "Searching for patterns in text",
            "Finding the maximum flow in a network"
        ],
        "correctAnswer": "Pathfinding in games and robotics",
        "explanation": "The A* search algorithm is commonly used for pathfinding in games and robotics, where finding the shortest path from a starting point to a goal is essential."
    },
    {
        "question": "What is the time complexity of the Knuth-Morris-Pratt (KMP) algorithm for string searching?",
        "options": [
            "O(n)",
            "O(m)",
            "O(n log n)",
            "O(n + m)"
        ],
        "correctAnswer": "O(n + m)",
        "explanation": "The Knuth-Morris-Pratt algorithm has a time complexity of O(n + m), where n is the length of the text and m is the length of the pattern to be searched."
    },
    {
        "question": "What is the main advantage of using a red-black tree over a binary search tree (BST)?",
        "options": [
            "Red-black trees have faster search operations",
            "Red-black trees guarantee balanced height, ensuring O(log n) operations",
            "Red-black trees require less memory allocation",
            "Red-black trees allow for parallel processing"
        ],
        "correctAnswer": "Red-black trees guarantee balanced height, ensuring O(log n) operations",
        "explanation": "Red-black trees maintain balanced height, ensuring that operations such as insertion, deletion, and search have O(log n) time complexity."
    },
    {
        "question": "What is the time complexity of the Bellman-Ford algorithm for finding the shortest paths from a single source vertex in a weighted graph?",
        "options": [
            "O(V)",
            "O(E)",
            "O(V log V)",
            "O(VE)"
        ],
        "correctAnswer": "O(VE)",
        "explanation": "The Bellman-Ford algorithm has a time complexity of O(VE) due to its nested loops over all edges and vertices."
    },
    {
        "question": "What is the primary advantage of using a trie data structure?",
        "options": [
            "Tries have faster search operations than hash tables",
            "Tries allow for efficient prefix search operations",
            "Tries have constant-time access to elements",
            "Tries guarantee balanced height, ensuring O(log n) operations"
        ],
        "correctAnswer": "Tries allow for efficient prefix search operations",
        "explanation": "Tries are tree-based data structures that store strings in a hierarchical manner, making them efficient for prefix search operations."
    },
    {
        "question": "What is the purpose of the Ford-Fulkerson algorithm?",
        "options": [
            "To find the minimum spanning tree of a graph",
            "To find the maximum flow in a network",
            "To perform topological sorting of a graph",
            "To detect cycles in a graph"
        ],
        "correctAnswer": "To find the maximum flow in a network",
        "explanation": "The Ford-Fulkerson algorithm is used to find the maximum flow in a flow network, which represents a directed graph where each edge has a capacity."
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
                SizedBox(width: 100,),
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
                                      SizedBox(height: 40),
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
