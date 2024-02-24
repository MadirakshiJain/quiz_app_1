import 'package:flutter/material.dart';

// Import your home pages and other necessary widgets
import 'package:quiz/que_widgets.dart/homepage/civil_home.dart';
import 'package:quiz/que_widgets.dart/homepage/cse_home.dart';
import 'package:quiz/que_widgets.dart/homepage/ecm_home.dart';
import 'package:quiz/que_widgets.dart/homepage/ee_home.dart';
import 'package:quiz/que_widgets.dart/homepage/mec_home.dart';
import 'package:quiz/screens.dart/search.dart';
import 'package:quiz/screens.dart/vidscreen.dart';

// Define your home pages and other necessary widgets
Widget cseHomePage = Homepage();
Widget cseSearchPage = Search();
Widget cseVideosPage = VidScreen(videoUrls: [
  'https://www.youtube.com/watch?v=URfNAAuZ52w&list=PLbGui_ZYuhigZkqrHbI_ZkPBrIr5Rsd5L&index=1',
  'https://www.youtube.com/watch?v=ZzVCB98v6tY&list=PLu191Xpr_tMAuh2Xfy_qX83b5Eua_knWY&index=1',
  'https://www.youtube.com/watch?v=04A4PRikkCY&list=PL-JvKqQx2AteLNR8UO4UQiDmQF-Wotu5G&index=1',
  'https://www.youtube.com/watch?v=wGLTV8MgLlA&list=PLU6SqdYcYsfJ27O0dvuMwafS3X8CecqUg&index=1',
  'https://www.youtube.com/watch?v=-M7oIM8hKSU&list=PL9zFgBale5fuk0FSD8CNixOXXWvNwu7ba&index=1',
  'https://www.youtube.com/watch?v=RBSGKlAvoiM&list=PLWKjhJtqVAbn5emQ3RRG8gEBqkhf_5vxD&index=1'
]);

Widget mechHomePage = Mec_Home();
Widget mechSearchPage = Search();
Widget mechVideosPage = VidScreen(videoUrls: [
  'https://www.youtube.com/watch?v=Yfi9CPGmgMc&list=PLynLXReWAxdEsvNa11Khe1EJhtyUUgDf9&index=2',
  'https://www.youtube.com/watch?v=TAZY6Nw7p0U&list=PLynLXReWAxdEsvNa11Khe1EJhtyUUgDf9&index=4',
  'https://www.youtube.com/watch?v=KdFH8Yhdk_4&list=PLynLXReWAxdEsvNa11Khe1EJhtyUUgDf9&index=9',
  'https://www.youtube.com/watch?v=l1zPAvo_Yrg&list=PLynLXReWAxdEsvNa11Khe1EJhtyUUgDf9&index=3',
  'https://www.youtube.com/watch?v=glDvzmhgMok&list=PLynLXReWAxdEsvNa11Khe1EJhtyUUgDf9&index=5'
]);

Widget eeHomePage = Ee_Home();
Widget eeSearchPage = Search();
Widget eeVideosPage = VidScreen(videoUrls: [
  
  'https://www.youtube.com/watch?v=ibEoZNgh_7Y',
  'https://www.youtube.com/watch?v=FN6p4Njzpmo',
  'https://www.youtube.com/watch?v=WxCGu1yY_Qo',
  'https://www.youtube.com/watch?v=K3K4x5cxqV0',
  'https://www.youtube.com/watch?v=nUcb0MDEbo4'

]);

Widget ecmHomePage = Ecm_Home();
Widget ecmSearchPage = Search();
Widget ecmVideosPage = VidScreen(videoUrls: [
  
  'https://www.youtube.com/watch?v=VRS2dpjEo8M',
  'https://www.youtube.com/watch?v=VRi11WznZq8&list=PLs5_Rtf2P2r6-noHtWAtmWi1GhxJ90eJH',
  'https://www.youtube.com/watch?v=r-X9coYTOV4&list=PLah6faXAgguOeMUIxS22ZU4w5nDvCl5gs',

]);

Widget civilHomePage = Civil_Home();
Widget civilSearchPage = Search();
Widget civilVideosPage = VidScreen(videoUrls: [
  'https://www.youtube.com/watch?v=fAyx0uZcCWg&list=PLjtQ3BMex7hvh7pPtjwPDV17J-WaDX7Tl',
  'https://www.youtube.com/watch?v=wvchUXGqDXc&list=PLjtQ3BMex7htdoVod1tweScYy8iQ3UgIf',
  'https://www.youtube.com/watch?v=j8ybhHC5Xho&list=PLjtQ3BMex7huwsIez_5JxtjrQ4zZwZ-du'
]);

class BottomNav extends StatefulWidget {
  final int initialIndex;
  final List<Widget> pages;

  const BottomNav({Key? key, this.initialIndex = 0, required this.pages})
      : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int _selectedIndex;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final Color _normalColor = Colors.black; // or any other color
  final Color _selectedColor = Colors.purple; // color when tapped

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       
        child: Center(
          child: widget.pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.play_circle),
        label: 'Videos',
      ),
    ];
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
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
      child: BottomNavigationBar(
        items: _buildBottomNavigationBarItems(),
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class CseBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNav(
      initialIndex: 0, // Show CSE-related content initially
      pages: [
        cseHomePage,
        cseSearchPage,
        cseVideosPage,
      ],
    );
  }
}

class MechBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNav(
      initialIndex: 0, // Show Mech-related content initially
      pages: [
        mechHomePage,
        mechSearchPage,
        mechVideosPage,
      ],
    );
  }
}

class EeBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNav(
      initialIndex: 0, // Show Mech-related content initially
      pages: [
        eeHomePage,
        eeSearchPage,
        eeVideosPage,
      ],
    );
  }
}

class EcmBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNav(
      initialIndex: 0, // Show Mech-related content initially
      pages: [
        ecmHomePage,
        ecmSearchPage,
        ecmVideosPage,
      ],
    );
  }
}

class CivilBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNav(
      initialIndex: 0, // Show Mech-related content initially
      pages: [
        civilHomePage,
        civilSearchPage,
        civilVideosPage,
      ],
    );
  }
}