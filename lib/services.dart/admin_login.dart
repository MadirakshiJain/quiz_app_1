import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz/services.dart/add_quiz.dart';


class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

    TextEditingController username_controller=new TextEditingController();
     TextEditingController password_controller=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 160, 20, 184), 
      body: SingleChildScrollView(
        
        child: Container(
          
          margin: EdgeInsets.only(left: 30,right: 30,top: 60),
          child: Form(child:
          Column(
            children: [
               Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Navigate back to previous page
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                        SizedBox(width: 30,),
                        Expanded(child: Text("Admin  Login",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
                      ],
                    ),
             SizedBox(height: 70,),
             Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              child:Container(
                height: MediaQuery.of(context).size.height/2.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
        
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 5,bottom:5),
                  margin:EdgeInsets.symmetric(horizontal: 20) ,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 160, 160, 147),
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: username_controller,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please Enter Username";
                        }
                      },
                      decoration: InputDecoration(border: InputBorder.none,
                      hintText: "Username",
                      helperStyle: TextStyle(
                        color: Color.fromARGB(255, 160, 160, 147),
                      )),
                    ),
                  ),),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 5,bottom:5),
                  margin:EdgeInsets.symmetric(horizontal: 20) ,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 160, 160, 147),
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: password_controller,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please Enter Password";
                        }
                      },
                      decoration: InputDecoration(border: InputBorder.none,
                      hintText: "Password",
                      helperStyle: TextStyle(
                        color: Color.fromARGB(255, 160, 160, 147),
                      )),
                    ),
                  ),),
                  SizedBox(height: 40,
                  ),
                  GestureDetector(
                    onTap: (){
                      LoginAdmin();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                       color: Color.fromARGB(255, 160, 20, 184), 
                       borderRadius: BorderRadius.circular(10),
                            
                      ),
                      child: Center(
                        child: Text("Login",style: TextStyle(color: Colors.white,
                        fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )
                  ],
                ),
              ) ,
             )
          ],)),
        ),
      ),
    );
  }
  void LoginAdmin() {
  bool invalidCredentials = true;

  FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
    snapshot.docs.forEach((result) {
      if (result.data()['id'] == username_controller.text.trim() &&
          result.data()['password'] == password_controller.text.trim()) {
        // If credentials are correct, navigate to Add_Quiz screen
        invalidCredentials = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Add_Quiz()),
        );
      }
    });

    if (invalidCredentials) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid username or password",style: TextStyle(fontSize: 18),),
        
      ));
    }
  });
}

}