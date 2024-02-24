import 'package:flutter/material.dart';
import 'package:quiz/que_widgets.dart/homepage/mec_home.dart';
import 'package:quiz/screens.dart/search.dart';
import 'package:quiz/screens.dart/vidscreen.dart';



class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // Define colors for normal and selected state
  final Color _normalColor = Colors.black; // or any other color
  final Color _selectedColor = Colors.purple; // color when tapped

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: CreateBottombar(context),
    );
  }

  final _widgetOptions = [
    new Mec_Home(),
    new Search(),
    new VidScreen(
      videoUrls: [
        'https://www.youtube.com/watch?v=URfNAAuZ52w&list=PLbGui_ZYuhigZkqrHbI_ZkPBrIr5Rsd5L&index=1',
        'https://www.youtube.com/watch?v=ZzVCB98v6tY&list=PLu191Xpr_tMAuh2Xfy_qX83b5Eua_knWY&index=1',
        'https://www.youtube.com/watch?v=04A4PRikkCY&list=PL-JvKqQx2AteLNR8UO4UQiDmQF-Wotu5G&index=1',
        'https://www.youtube.com/watch?v=wGLTV8MgLlA&list=PLU6SqdYcYsfJ27O0dvuMwafS3X8CecqUg&index=1',
        'https://www.youtube.com/watch?v=-M7oIM8hKSU&list=PL9zFgBale5fuk0FSD8CNixOXXWvNwu7ba&index=1',
        'https://www.youtube.com/watch?v=RBSGKlAvoiM&list=PLWKjhJtqVAbn5emQ3RRG8gEBqkhf_5vxD&index=1'
      ],
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Container CreateBottombar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 5,
            spreadRadius: 3,
            color: Color.fromARGB(255, 221, 106, 250).withOpacity(.4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        child: SizedBox(
          height: 55,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.white,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () => _onItemTapped(0),
                    iconSize: 30,
                    padding: EdgeInsets.zero,
                    color: _selectedIndex == 0 ? _selectedColor : _normalColor,
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => _onItemTapped(1),
                    iconSize: 30,
                    padding: EdgeInsets.zero,
                    color: _selectedIndex == 1 ? _selectedColor : _normalColor,
                  ),
                  IconButton(
                    icon: Icon(Icons.play_circle),
                    onPressed: () => _onItemTapped(2),
                    iconSize: 30,
                    padding: EdgeInsets.zero,
                    color: _selectedIndex == 2 ? _selectedColor : _normalColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}