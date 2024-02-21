import 'package:flutter/material.dart';

class vidscreen extends StatelessWidget {
  const vidscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
         title: Text("Popular Videos"),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CSE",style: TextStyle( color: Color.fromARGB(255, 160, 20, 184),fontSize: 18,fontWeight: FontWeight.bold ),),
                  SizedBox(height: 30),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 300,
                              height: 100,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 160, 20, 184),
                              ),
                              child: Center(child: Text("YouTube")),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 300,
                              height: 100,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 160, 20, 184),
                              ),
                              child: Center(child: Text("YouTube")),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 300,
                              height: 100,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 160, 20, 184),
                              ),
                              child: Center(child: Text("YouTube")),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 300,
                              height: 100,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 160, 20, 184),
                              ),
                              child: Center(child: Text("YouTube")),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 300,
                              height: 100,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 160, 20, 184),
                              ),
                              child: Center(child: Text("YouTube")),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        )
                      ],
                    ),
                  ),
                   SizedBox(height: 30),
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        )
                      ],
                    ),
                  ),
                   SizedBox(height: 30),
                   
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        )
                      ],
                    ),
                  ),
                   SizedBox(height: 30),
                  
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 300,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 160, 20, 184),
                          ),
                          child: Center(child: Text("YouTube")),
                        )
                      ],
                    ),
                  ),
                   SizedBox(height: 30),
              
                ],
              ),
            ),
          ),
        ));
  }
}