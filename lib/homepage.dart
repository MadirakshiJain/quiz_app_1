import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/admin_login.dart';
import 'package:quiz/que.dart';

import 'package:quiz/topics/civil.dart';
import 'package:quiz/topics/cse_topics.dart';
import 'package:quiz/topics/ee_topics.dart';
import 'package:quiz/topics/ecm.dart';
import 'package:quiz/topics/mec_topics.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USERNAME",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
        backgroundColor: Color.fromARGB(255, 160, 20, 184),
      iconTheme: IconThemeData.fallback(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 20, 184),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                  ),
                  Text(
                    'Hello!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Admin'),
              onTap: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminLogin()),
                          );
                // Handle item 1 tap
              },
              // selectedTileColor: Color.fromARGB(255, 160, 20, 184),
            ),
            // ListTile(
            //   title: Text('Item 2'),
            //   onTap: () {
            //     // Handle item 2 tap
            //   },
            // ),
            // Add more ListTiles for additional items
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: (81.16 / 100) * MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 155,
                          padding: EdgeInsets.only(left: 50),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 160, 20, 184),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          // child: Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     CircleAvatar(
                          //       // backgroundImage: AssetImage("homepageimg.png"),
                          //       // backgroundColor: Colors.pinkAccent,
                          //       radius: 29,
                          //     ),
                          //     Container(
                          //         padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          //         child: Text("USERNAME",
                          //             style: TextStyle(
                          //                 fontWeight: FontWeight.w500,
                          //                 fontSize: 25)))
                          //   ],
                          // ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 70, top: 10),
                          child: Row(
                            children: [Image.asset("homepageimg.png")],
                          ),
                        )
                      ],
                    ),
                    // SizedBox(height: 10),
                    Text(
                      "Branches",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    // SizedBox(height: 60),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 160, 20, 184),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Center(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("cseimg.png"),
                                        radius: 40,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 160, 20, 184)),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Cse_Topics()),
                                            );
                                          },
                                          child: Text(
                                            "CSE",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 160, 20, 184),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Center(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("mechenicalimg.png"),
                                        radius: 40,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 160, 20, 184)),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Mec_Topics()),
                                            );
                                          },
                                          child: Text(
                                            "Mec",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 160, 20, 184),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Center(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("electricalimg.png"),
                                        radius: 40,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 160, 20, 184)),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Ee_Topics()),
                                            );
                                          },
                                          child: Text(
                                            "Ee",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 160, 20, 184),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Center(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("ECMimg.png"),
                                        radius: 40,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 160, 20, 184)),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Ecm_Topics()),
                                            );
                                          },
                                          child: Text(
                                            "Ecm",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 160, 20, 184),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Center(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("civilimg.png"),
                                        radius: 40,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 160, 20, 184)),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Civil_Topics()),
                                            );
                                          },
                                          child: Text(
                                            "Civil",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 60),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => AdminLogin()),
                    //       );
                    //     },
                    //     child: Text(
                    //       "ADMIN",
                    //       style: TextStyle(
                    //           color: Color.fromARGB(255, 160, 20, 184)),
                    //     )),
                    //  SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height/99.99)*100),
          Container(
            child: BottomNavigationBar(items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_file_outlined), label: 'vedios'),
              BottomNavigationBarItem(
                icon: Icon(Icons.admin_panel_settings_rounded),
                label: 'admin',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.man_2_outlined),
              //   label: 'profile'
              //   ),
            ]),
          ),
        ],
      ),
    );
  }
}
