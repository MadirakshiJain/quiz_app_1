import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/que_widgets.dart/widgets/category.dart';
import 'package:quiz/que_widgets.dart/widgets/result.dart';

class TestPage extends StatefulWidget {
  final String selectedBranch; // Add selected branch as a parameter

  const TestPage({Key? key, required this.selectedBranch}) : super(key: key);

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
    initializeQuestions();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void initializeQuestions() {
    // Initialize questions based on the selected branch
    if (widget.selectedBranch == 'CSE') {
      // Set questions for CSE branch
      questions = [
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
        
    }
];
    } else if (widget.selectedBranch == 'MECH') {
      // Set questions for MECH branch
      questions = [
  {
    "question": "What is the purpose of a regenerator in a gas turbine plant?",
    "options": [
      "To increase the combustion temperature.",
      "To increase the turbine efficiency.",
      "To recover heat from the exhaust gases.",
      "To reduce the compressor work."
    ],
    "correctAnswer": "To recover heat from the exhaust gases."
  },
  {
    "question": "What is the significance of the Reynolds number in fluid flow?",
    "options": [
      "It determines the flow regime.",
      "It measures the fluid viscosity.",
      "It calculates the fluid pressure.",
      "It estimates the fluid density."
    ],
    "correctAnswer": "It determines the flow regime."
  },
  {
    "question": "What is the purpose of Hooke's Law in material science?",
    "options": [
      "To describe the behavior of elastic materials.",
      "To predict fracture toughness.",
      "To measure the density of materials.",
      "To analyze creep deformation."
    ],
    "correctAnswer": "To describe the behavior of elastic materials."
  },
  {
    "question": "Which factor is most important in selecting a suitable bearing for high-speed applications?",
    "options": [
      "Load capacity.",
      "Lubrication requirement.",
      "Material compatibility.",
      "Temperature resistance."
    ],
    "correctAnswer": "Lubrication requirement."
  },
  {
    "question": "What is the primary advantage of hot working over cold working in metal forming processes?",
    "options": [
      "Higher material strength.",
      "Better surface finish.",
      "Reduced energy consumption.",
      "Increased ductility."
    ],
    "correctAnswer": "Increased ductility."
  },
  {
    "question": "Which heat transfer mechanism dominates in vacuum insulation panels?",
    "options": [
      "Conduction.",
      "Convection.",
      "Radiation.",
      "Advection."
    ],
    "correctAnswer": "Radiation."
  },
  {
    "question": "What is the main purpose of a PID controller in feedback control systems?",
    "options": [
      "To eliminate steady-state errors.",
      "To reduce overshoot in transient response.",
      "To improve system stability.",
      "To minimize integral windup."
    ],
    "correctAnswer": "To improve system stability."
  },
  {
    "question": "Which mathematical technique is used to find the eigenvalues of a matrix?",
    "options": [
      "Gaussian elimination.",
      "Jacobi iteration.",
      "Singular value decomposition.",
      "Matrix diagonalization."
    ],
    "correctAnswer": "Matrix diagonalization."
  },
  {
    "question": "What is the principle behind the operation of a hydraulic jack?",
    "options": [
      "Pascal's law.",
      "Bernoulli's principle.",
      "Archimedes' principle.",
      "Newton's second law."
    ],
    "correctAnswer": "Pascal's law."
  },
  {
    "question": "What is the primary function of a flywheel in a reciprocating engine?",
    "options": [
      "To reduce engine vibrations.",
      "To store kinetic energy.",
      "To control engine timing.",
      "To increase engine compression."
    ],
    "correctAnswer": "To store kinetic energy."
  },
  {
    "question": "Which material property is measured using a Charpy impact test?",
    "options": [
      "Tensile strength.",
      "Hardness.",
      "Fracture toughness.",
      "Elastic modulus."
    ],
    "correctAnswer": "Fracture toughness."
  },
  {
    "question": "What is the primary advantage of a multistage compressor over a single-stage compressor?",
    "options": [
      "Higher volumetric efficiency.",
      "Lower maintenance requirements.",
      "Reduced energy consumption.",
      "Increased pressure ratio."
    ],
    "correctAnswer": "Increased pressure ratio."
  },
  {
    "question": "Which type of heat exchanger offers the highest heat transfer rate per unit area?",
    "options": [
      "Shell and tube heat exchanger.",
      "Plate heat exchanger.",
      "Double pipe heat exchanger.",
      "Finned tube heat exchanger."
    ],
    "correctAnswer": "Plate heat exchanger."
  },
  {
    "question": "What is the primary function of a nozzle in a converging-diverging nozzle?",
    "options": [
      "To increase fluid velocity.",
      "To decrease fluid pressure.",
      "To control fluid flow rate.",
      "To prevent fluid cavitation."
    ],
    "correctAnswer": "To increase fluid velocity."
  },
  {
    "question": "Which material property is critical for determining the fatigue life of a component?",
    "options": [
      "Ultimate tensile strength.",
      "Elastic modulus.",
      "Fatigue strength.",
      "Yield strength."
    ],
    "correctAnswer": "Fatigue strength."
  },
  {
    "question": "What is the primary advantage of using a helical gear over a spur gear?",
    "options": [
      "Lower noise level.",
      "Higher load capacity.",
      "Better efficiency.",
      "Reduced backlash."
    ],
    "correctAnswer": "Higher load capacity."
  },
  {
    "question": "Which type of refrigeration cycle offers the highest coefficient of performance (COP)?",
    "options": [
      "Carnot cycle.",
      "Rankine cycle.",
      "Reversed Brayton cycle.",
      "Vapor compression cycle."
    ],
    "correctAnswer": "Carnot cycle."
  },
  {
    "question": "What is the main function of a governor in a steam turbine?",
    "options": [
      "To control steam flow rate.",
      "To regulate steam temperature.",
      "To maintain constant shaft speed.",
      "To improve steam quality."
    ],
    "correctAnswer": "To maintain constant shaft speed."
  },
  {
    "question": "Which factor is most critical in determining the performance of a centrifugal pump?",
    "options": [
      "Head developed.",
      "Speed of rotation.",
      "Impeller diameter.",
      "Efficiency."
    ],
    "correctAnswer": "Head developed."
  },
  {
    "question": "What is the primary purpose of a draft tube in a hydraulic turbine?",
    "options": [
      "To increase turbine efficiency.",
      "To prevent cavitation.",
      "To reduce turbine vibrations.",
      "To control water flow."
    ],
    "correctAnswer": "To prevent cavitation."
  }
];

    } else if (widget.selectedBranch == 'EE') {
      // Set questions for EEE branch
      questions = [
  {
    "question": "What is the purpose of a transformer in an electrical power system?",
    "options": [
      "To convert AC to DC power.",
      "To step up or step down voltage levels.",
      "To regulate frequency of the power supply.",
      "To store electrical energy."
    ],
    "correctAnswer": "To step up or step down voltage levels."
  },
  {
    "question": "What is the significance of the power factor in AC circuits?",
    "options": [
      "It measures the efficiency of the circuit.",
      "It determines the maximum power transfer.",
      "It indicates the phase relationship between voltage and current.",
      "It regulates the frequency of the AC supply."
    ],
    "correctAnswer": "It indicates the phase relationship between voltage and current."
  },
  {
    "question": "What is the primary function of a rectifier circuit?",
    "options": [
      "To convert AC to DC.",
      "To amplify electrical signals.",
      "To generate high-frequency oscillations.",
      "To regulate voltage levels."
    ],
    "correctAnswer": "To convert AC to DC."
  },
  {
    "question": "Which parameter is most critical in determining the speed of a DC motor?",
    "options": [
      "Armature resistance.",
      "Field current.",
      "Back EMF.",
      "Load torque."
    ],
    "correctAnswer": "Back EMF."
  },
  {
    "question": "What is the primary advantage of using a synchronous motor over an induction motor?",
    "options": [
      "Higher efficiency.",
      "Lower cost.",
      "Better starting torque.",
      "Simple construction."
    ],
    "correctAnswer": "Higher efficiency."
  },
  {
    "question": "Which type of fault occurs when one or more conductors come in contact with the ground?",
    "options": [
      "Phase-to-phase fault.",
      "Line-to-line fault.",
      "Line-to-ground fault.",
      "Three-phase fault."
    ],
    "correctAnswer": "Line-to-ground fault."
  },
  {
    "question": "What is the main function of a surge arrester in a power system?",
    "options": [
      "To protect against overvoltage.",
      "To regulate frequency.",
      "To improve power factor.",
      "To prevent short circuits."
    ],
    "correctAnswer": "To protect against overvoltage."
  },
  {
    "question": "Which device is used to protect electrical circuits from overcurrent conditions?",
    "options": [
      "Fuse.",
      "Relay.",
      "Circuit breaker.",
      "Inductor."
    ],
    "correctAnswer": "Circuit breaker."
  },
  {
    "question": "What is the primary purpose of a capacitor in an AC circuit?",
    "options": [
      "To store electrical energy.",
      "To limit current flow.",
      "To block DC components.",
      "To control voltage fluctuations."
    ],
    "correctAnswer": "To control voltage fluctuations."
  },
  {
    "question": "Which factor determines the capacitance of a parallel-plate capacitor?",
    "options": [
      "Distance between plates.",
      "Area of plates.",
      "Dielectric constant.",
      "Voltage applied."
    ],
    "correctAnswer": "Distance between plates."
  },
  {
    "question": "What is the primary advantage of using a star-delta starter for induction motors?",
    "options": [
      "Reduced starting current.",
      "Improved efficiency.",
      "Higher torque at low speeds.",
      "Faster acceleration."
    ],
    "correctAnswer": "Reduced starting current."
  },
  {
    "question": "Which type of generator is commonly used for producing electrical power in power plants?",
    "options": [
      "DC generator.",
      "Synchronous generator.",
      "Induction generator.",
      "Universal generator."
    ],
    "correctAnswer": "Synchronous generator."
  },
  {
    "question": "What is the primary function of a step-up transformer in a power transmission system?",
    "options": [
      "To increase current.",
      "To decrease voltage.",
      "To increase voltage.",
      "To decrease current."
    ],
    "correctAnswer": "To increase voltage."
  },
  {
    "question": "Which parameter is directly proportional to the magnetic flux density in a magnetic circuit?",
    "options": [
      "Permeability of the material.",
      "Cross-sectional area of the core.",
      "Number of turns in the coil.",
      "Applied voltage."
    ],
    "correctAnswer": "Number of turns in the coil."
  },
  {
    "question": "What is the primary purpose of a ground wire in electrical installations?",
    "options": [
      "To provide a return path for current.",
      "To regulate voltage.",
      "To reduce electromagnetic interference.",
      "To control power factor."
    ],
    "correctAnswer": "To provide a return path for current."
  },
  {
    "question": "Which type of motor is commonly used for high-speed applications such as fans and blowers?",
    "options": [
      "Induction motor.",
      "DC motor.",
      "Synchronous motor.",
      "Universal motor."
    ],
    "correctAnswer": "Induction motor."
  },
  {
    "question": "What is the main advantage of using a three-phase power system over a single-phase system?",
    "options": [
      "Higher efficiency.",
      "Lower cost.",
      "Simpler construction.",
      "Better voltage regulation."
    ],
    "correctAnswer": "Higher efficiency."
  },
  {
    "question": "Which parameter determines the pitch of a synchronous generator?",
    "options": [
      "Number of poles.",
      "Applied voltage.",
      "Rotor speed.",
      "Armature resistance."
    ],
    "correctAnswer": "Number of poles."
  },
  {
    "question": "What is the primary purpose of a protective relay in a power system?",
    "options": [
      "To control voltage fluctuations.",
      "To protect against overcurrent conditions.",
      "To regulate frequency.",
      "To improve power factor."
    ],
    "correctAnswer": "To protect against overcurrent conditions."
  },
  {
    "question": "Which type of transmission line offers the lowest line losses?",
    "options": [
      "Overhead line.",
      "Underground cable.",
      "Submarine cable.",
      "Twisted pair cable."
    ],
    "correctAnswer": "Submarine cable."
  }
];

    } else if (widget.selectedBranch == 'ECM') {
      // Set questions for EEE branch
      questions =[
  {
    "question": "What is the function of an operational amplifier (op-amp) in electronic circuits?",
    "options": [
      "To amplify signals.",
      "To generate high-frequency oscillations.",
      "To store electrical energy.",
      "To regulate voltage levels."
    ],
    "correctAnswer": "To amplify signals."
  },
  {
    "question": "Which parameter is most critical in determining the gain of a transistor amplifier?",
    "options": [
      "Emitter current.",
      "Collector current.",
      "Base voltage.",
      "Load resistance."
    ],
    "correctAnswer": "Load resistance."
  },
  {
    "question": "What is the primary advantage of using a MOSFET over a BJT?",
    "options": [
      "Higher gain.",
      "Lower cost.",
      "Faster switching speed.",
      "Better linearity."
    ],
    "correctAnswer": "Faster switching speed."
  },
  {
    "question": "Which type of diode is commonly used for voltage regulation?",
    "options": [
      "Zener diode.",
      "Schottky diode.",
      "LED.",
      "Varactor diode."
    ],
    "correctAnswer": "Zener diode."
  },
  {
    "question": "What is the function of a flip-flop in digital circuits?",
    "options": [
      "To store a single bit of data.",
      "To perform mathematical operations.",
      "To generate clock signals.",
      "To regulate voltage levels."
    ],
    "correctAnswer": "To store a single bit of data."
  },
  {
    "question": "Which logic gate produces an output high only when all inputs are low?",
    "options": [
      "AND gate.",
      "OR gate.",
      "NOT gate.",
      "NAND gate."
    ],
    "correctAnswer": "NAND gate."
  },
  {
    "question": "What is the primary purpose of a voltage regulator in electronic circuits?",
    "options": [
      "To amplify signals.",
      "To generate clock signals.",
      "To regulate voltage levels.",
      "To store electrical energy."
    ],
    "correctAnswer": "To regulate voltage levels."
  },
  {
    "question": "Which parameter determines the cutoff frequency of an RC low-pass filter?",
    "options": [
      "Resistor value.",
      "Capacitor value.",
      "Inductor value.",
      "Frequency of the input signal."
    ],
    "correctAnswer": "Capacitor value."
  },
  {
    "question": "What is the main advantage of using pulse-width modulation (PWM) in power electronics?",
    "options": [
      "High efficiency.",
      "Reduced cost.",
      "Faster switching speed.",
      "Improved linearity."
    ],
    "correctAnswer": "High efficiency."
  },
  {
    "question": "Which type of oscillator circuit is commonly used for generating stable clock signals in digital systems?",
    "options": [
      "Wien bridge oscillator.",
      "RC phase-shift oscillator.",
      "Colpitts oscillator.",
      "Crystal oscillator."
    ],
    "correctAnswer": "Crystal oscillator."
  },
  {
    "question": "What is the function of a voltage comparator in electronic circuits?",
    "options": [
      "To amplify signals.",
      "To perform mathematical operations.",
      "To compare two voltage levels.",
      "To store electrical energy."
    ],
    "correctAnswer": "To compare two voltage levels."
  },
  {
    "question": "Which type of modulation is commonly used for transmitting analog signals over long distances?",
    "options": [
      "Frequency modulation (FM).",
      "Amplitude modulation (AM).",
      "Phase modulation (PM).",
      "Pulse modulation."
    ],
    "correctAnswer": "Amplitude modulation (AM)."
  },
  {
    "question": "What is the primary function of a Schmitt trigger in electronic circuits?",
    "options": [
      "To amplify signals.",
      "To generate clock signals.",
      "To regulate voltage levels.",
      "To convert a noisy signal into a clean digital signal."
    ],
    "correctAnswer": "To convert a noisy signal into a clean digital signal."
  },
  {
    "question": "Which type of filter is commonly used for removing noise from analog signals?",
    "options": [
      "Butterworth filter.",
      "Chebyshev filter.",
      "Bessel filter.",
      "Active filter."
    ],
    "correctAnswer": "Active filter."
  },
  {
    "question": "What is the primary purpose of a Schottky transistor in electronic circuits?",
    "options": [
      "To amplify signals.",
      "To generate clock signals.",
      "To regulate voltage levels.",
      "To perform high-speed switching."
    ],
    "correctAnswer": "To perform high-speed switching."
  },
  {
    "question": "Which type of logic gate is commonly used for arithmetic operations in digital systems?",
    "options": [
      "AND gate.",
      "OR gate.",
      "XOR gate.",
      "NAND gate."
    ],
    "correctAnswer": "XOR gate."
  },
  {
    "question": "What is the primary advantage of using a CMOS technology in integrated circuits?",
    "options": [
      "Lower power consumption.",
      "Higher gain.",
      "Faster switching speed.",
      "Better linearity."
    ],
    "correctAnswer": "Lower power consumption."
  },
  {
    "question": "Which parameter determines the bandwidth of an amplifier circuit?",
    "options": [
      "Resistor value.",
      "Capacitor value.",
      "Inductor value.",
      "Gain."
    ],
    "correctAnswer": "Capacitor value."
  },
  {
    "question": "What is the primary function of a voltage divider in electronic circuits?",
    "options": [
      "To amplify signals.",
      "To regulate voltage levels.",
      "To generate clock signals.",
      "To attenuate voltage."
    ],
    "correctAnswer": "To attenuate voltage."
  },
  {
    "question": "Which type of transistor configuration offers the highest current gain?",
    "options": [
      "Common-emitter configuration.",
      "Common-base configuration.",
      "Common-collector configuration.",
      "Emitter-follower configuration."
    ],
    "correctAnswer": "Common-base configuration."
  },
  {
    "question": "What is the primary purpose of a sample-and-hold circuit in electronic systems?",
    "options": [
      "To amplify signals.",
      "To generate clock signals.",
      "To regulate voltage levels.",
      "To capture and hold an analog voltage."
    ],
    "correctAnswer": "To capture and hold an analog voltage."
  }
];

    } else if (widget.selectedBranch == 'CIVIL') {
      // Set questions for EEE branch
      questions = [
  {
    "question": "What is the primary function of a slump test in concrete construction?",
    "options": [
      "To measure the workability of fresh concrete.",
      "To determine the compressive strength of hardened concrete.",
      "To measure the water-cement ratio of concrete mix.",
      "To assess the durability of concrete."
    ],
    "correctAnswer": "To measure the workability of fresh concrete."
  },
  {
    "question": "Which type of foundation is most suitable for a high-rise building constructed on soft clay soil?",
    "options": [
      "Raft foundation.",
      "Pile foundation.",
      "Strip foundation.",
      "Spread footing."
    ],
    "correctAnswer": "Pile foundation."
  },
  {
    "question": "What is the primary purpose of adding plasticizers to concrete mixtures?",
    "options": [
      "To increase the rate of hydration.",
      "To improve the workability of fresh concrete.",
      "To enhance the durability of hardened concrete.",
      "To reduce the setting time of concrete."
    ],
    "correctAnswer": "To improve the workability of fresh concrete."
  },
  {
    "question": "Which type of cement is most suitable for underwater construction?",
    "options": [
      "Ordinary Portland cement (OPC).",
      "Rapid hardening cement.",
      "Sulfate-resistant cement.",
      "Portland slag cement."
    ],
    "correctAnswer": "Portland slag cement."
  },
  {
    "question": "What is the primary purpose of adding fly ash to concrete mixtures?",
    "options": [
      "To increase the rate of hydration.",
      "To improve the workability of fresh concrete.",
      "To enhance the durability of hardened concrete.",
      "To reduce the heat of hydration."
    ],
    "correctAnswer": "To reduce the heat of hydration."
  },
  {
    "question": "Which material is commonly used as a stabilizer in soil stabilization techniques?",
    "options": [
      "Lime.",
      "Cement.",
      "Bitumen.",
      "Fly ash."
    ],
    "correctAnswer": "Lime."
  },
  {
    "question": "What is the primary function of a weir in hydraulic engineering?",
    "options": [
      "To regulate the flow of water.",
      "To measure the velocity of water.",
      "To control erosion along riverbanks.",
      "To divert water for irrigation purposes."
    ],
    "correctAnswer": "To regulate the flow of water."
  },
  {
    "question": "Which type of surveying instrument is used to measure horizontal angles with high precision?",
    "options": [
      "Total station.",
      "Theodolite.",
      "Level.",
      "GPS receiver."
    ],
    "correctAnswer": "Theodolite."
  },
  {
    "question": "What is the primary purpose of a pile cap in foundation construction?",
    "options": [
      "To distribute the load from the superstructure to individual piles.",
      "To prevent lateral movement of the foundation.",
      "To increase the bearing capacity of the soil.",
      "To provide a level surface for the foundation."
    ],
    "correctAnswer": "To distribute the load from the superstructure to individual piles."
  },
  {
    "question": "Which type of dam is most suitable for locations with narrow valleys and rocky foundations?",
    "options": [
      "Gravity dam.",
      "Arch dam.",
      "Embankment dam.",
      "Buttress dam."
    ],
    "correctAnswer": "Arch dam."
  },
  {
    "question": "What is the primary function of a retaining wall in civil engineering?",
    "options": [
      "To provide lateral support to soil.",
      "To control the flow of surface water.",
      "To protect structures from earthquakes.",
      "To divert traffic around obstacles."
    ],
    "correctAnswer": "To provide lateral support to soil."
  },
  {
    "question": "Which type of drainage system is most suitable for collecting and conveying stormwater from urban areas?",
    "options": [
      "Combined sewer system.",
      "Separate sewer system.",
      "French drain.",
      "Box culvert."
    ],
    "correctAnswer": "Separate sewer system."
  },
  {
    "question": "What is the primary function of a geotextile in civil engineering applications?",
    "options": [
      "To provide reinforcement to soil.",
      "To control erosion along riverbanks.",
      "To measure the velocity of water.",
      "To divert water for irrigation purposes."
    ],
    "correctAnswer": "To provide reinforcement to soil."
  },
  {
    "question": "Which type of soil compaction method is most suitable for large construction projects?",
    "options": [
      "Static compaction.",
      "Dynamic compaction.",
      "Vibro compaction.",
      "Precompression."
    ],
    "correctAnswer": "Vibro compaction."
  },
  {
    "question": "What is the primary function of a septic tank in wastewater treatment?",
    "options": [
      "To remove suspended solids from wastewater.",
      "To reduce the biochemical oxygen demand (BOD) of wastewater.",
      "To disinfect wastewater using ultraviolet light.",
      "To separate solids and liquids in wastewater."
    ],
    "correctAnswer": "To separate solids and liquids in wastewater."
  },
  {
    "question": "Which material is commonly used as a filter medium in rapid sand filtration for water treatment?",
    "options": [
      "Activated carbon.",
      "Gravel.",
      "Silica sand.",
      "Anthracite coal."
    ],
    "correctAnswer": "Silica sand."
  },
  {
    "question": "What is the primary function of a gabion in civil engineering applications?",
    "options": [
      "To provide erosion control along riverbanks.",
      "To measure the velocity of water.",
      "To divert water for irrigation purposes.",
      "To provide support to soil slopes."
    ],
    "correctAnswer": "To provide erosion control along riverbanks."
  },
  {
    "question": "Which type of bridge is most suitable for spanning long distances with minimal support structures?",
    "options": [
      "Beam bridge.",
      "Arch bridge.",
      "Suspension bridge.",
      "Cable-stayed bridge."
    ],
    "correctAnswer": "Suspension bridge."
  },
  {
    "question": "What is the primary function of a culvert in transportation engineering?",
    "options": [
      "To regulate the flow of water in rivers.",
      "To control erosion along riverbanks.",
      "To divert traffic around obstacles.",
      "To convey water beneath roads or railways."
    ],
    "correctAnswer": "To convey water beneath roads or railways."
  },
  {
    "question": "Which type of material is commonly used as a binder in asphalt concrete mixtures?",
    "options": [
      "Aggregate.",
      "Portland cement.",
      "Bitumen.",
      "Fly ash."
    ],
    "correctAnswer": "Bitumen."
  }
];

    }
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
    bool isCorrect = selectedOptionValue == correctAnswerValue;
    answerResults[questionIndex] = isCorrect;
    setState(() {
      optionBorderColors[questionIndex] =
          List<Color>.filled(questions![questionIndex]['options'].length, Color(0xffA42FC1));
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
      appBar:AppBar(
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
                                            backgroundColor: Color.fromARGB(255, 160, 20, 184),
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
                                              // and pass the necessary data
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) => ResultPage(
                                                    totalQuestions: questions!.length,
                                                    correctAnswers: calculateCorrectAnswers(),
                                                    incorrectAnswers: totalQuestions -
                                                        calculateCorrectAnswers(),
                                                    answerResults: calculateAnswerResults(), 
                                                    selectedCategory: Provider.of<QuizState>(context, listen: false).selectedCategory, 
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
