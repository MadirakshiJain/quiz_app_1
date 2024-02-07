import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Subcategory {
  final String name;

  Subcategory({required this.name});
}

class Category {
  final String name;
  final List<Subcategory> subcategories;

  Category({required this.name, required this.subcategories});
}

class DataManager {
  static List<Category> categories = [
    Category(
      name: 'Computer Science',
      subcategories: [
        Subcategory(name: 'Engineering Mathematics'),
        Subcategory(name: 'Digital Logic'),
         Subcategory(name: 'Computer Organization & Architecture'),
        Subcategory(name: 'Programmimg and Data Structure'),
         Subcategory(name: 'Algorithms'),
        Subcategory(name: 'Theory of Computation'),
         Subcategory(name: 'Compiler Design'),
          Subcategory(name: 'Operating System'),
           Subcategory(name: 'Databases'),
            Subcategory(name: 'Computer Networks'),
           
      ],
    ),
    Category(
      name: 'Mechanical',
      subcategories: [
       // Subcategory(name: 'Engineering Mathematics'),
        Subcategory(name: 'Applied Mechanics and Design'),
        Subcategory(name: 'Fluid Mechanics and Thermal Science'),
        Subcategory(name: 'Materials,Manufacturing and Industrial Engineering'),
        
      ],
    ),
    Category(
      name: 'Electronic',
      subcategories: [
        ///Subcategory(name: 'Engineering Mathematics'),
        Subcategory(name: 'Networks, Signals & Systems'),
        Subcategory(name: 'Electronic Devices'),
        Subcategory(name: 'Digital Circuits'),
        Subcategory(name: 'Analog Circuits'),
        Subcategory(name: 'Control Systems'),
        Subcategory(name: 'Communications'),
        Subcategory(name: 'Electromagnetics'),
      ],
    ),
    Category(
      name: 'Civil',
      subcategories: [
       // Subcategory(name: 'Engineering Mathematics'),
        Subcategory(name: 'Structural Engineering'),
        Subcategory(name: 'Geotechnical Engineering'),
        Subcategory(name: 'Water Resources Engineering'),
        Subcategory(name: 'Environment Engineering'),
        Subcategory(name: 'Transportation Engineering'),
        Subcategory(name: 'Geomatics Engineering'),
      ],
    ),
    Category(
      name: 'Electrical',
      subcategories: [
        Subcategory(name: 'Electric Circuits'),
        Subcategory(name: 'Electromagnetic Fields'),
        Subcategory(name: 'Signals and Systems'),
        Subcategory(name: 'Electrical Machines'),
        Subcategory(name: 'Power Systems'),
        Subcategory(name: 'Electrical and Electronic Measurements'),
         Subcategory(name: 'Analog and Digital Electronics'),
          Subcategory(name: 'Power Electronics'),
      ],
    ),
    // Add more categories and subcategories as needed
  ];

  static List<Category> getCategories() {
    return categories;
  }

  static List<Subcategory> getSubcategories(String categoryName) {
    Category selectedCategory = categories.firstWhere(
      (category) => category.name == categoryName,
      orElse: () => Category(name: '', subcategories: []),
    );

    return selectedCategory.subcategories;
  }
}

class QuizState with ChangeNotifier {
  String _selectedCategory = 'Computer Science';
  String? _selectedSubcategory;

  String get selectedCategory => _selectedCategory;
  String? get selectedSubcategory => _selectedSubcategory;

  set selectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  set selectedSubcategory(String? subcategory) {
    _selectedSubcategory = subcategory;
    notifyListeners();
  }
}



class YourWidget extends StatefulWidget {

  final Function(String, String) onCategorySelected;

  YourWidget({required this.onCategorySelected});
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  // String selectedCategory = 'Computer Science';
  // String ? selectedSubcategory ;

  @override
  Widget build(BuildContext context) {
    var quizState = Provider.of<QuizState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffececf8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: DataManager.getCategories()
                  .map((category) => DropdownMenuItem(
                        value: category.name,
                        child: Text(category.name, style: TextStyle(fontSize: 18, color: Colors.black)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  quizState.selectedCategory = value!;
                  quizState.selectedSubcategory = null;  // Reset selected subcategory when category changes
                });
              },
              value: quizState.selectedCategory,
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(15),
              hint: Text("Select Category", style: TextStyle(color: Color.fromARGB(255, 160, 160, 147), fontSize: 18, fontWeight: FontWeight.bold)),
              iconSize: 36,
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ),
        ),
          SizedBox(height: 20,),
               Text("Topic",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
        // Container for Subcategory Dropdown
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
        
         width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffececf8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: DataManager.getSubcategories(quizState.selectedCategory)
                  .map((subcategory) => DropdownMenuItem(
                      
                        value: subcategory.name,
                        child: Text(subcategory.name, style: TextStyle(fontSize: 18, color: Colors.black)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  quizState.selectedSubcategory = value;
                });
              },
              
               value: quizState.selectedSubcategory,
           isExpanded: true, 
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(15),
            
              hint: 
               Text("Select Topic", style: TextStyle(color: Color.fromARGB(255, 160, 160, 147), fontSize: 18, fontWeight: FontWeight.bold)),
             iconSize: 36,
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
