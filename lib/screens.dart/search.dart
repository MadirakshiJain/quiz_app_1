import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quiz/services.dart/gemini_api.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    RxString result = ''.obs;
    RxBool isLoading = false.obs; // Add a boolean to track loading state

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 160, 20, 184),
      body: Container(
        // height: 655,
        padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Navigate back to previous page
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  SizedBox(width: 12,),
                  Text("Search your query here !",style: TextStyle(
                              color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                            ),)
              ],),
              SizedBox(height: 15,),
              Row(
                children: [
                  
                  Expanded( 
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                 
                   ElevatedButton(
                    
                     style: ElevatedButton.styleFrom(
                           
                        backgroundColor: Color.fromARGB(255, 160, 20, 184),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50), 
                            )
                      ),
                     onPressed: () async {
                      isLoading.value = true;
                      result.value = await GeminiAPI.getGeminiData(textController.text);
                      isLoading.value = false;
                    },
                    child: Obx(() => isLoading.value
                        ? CircularProgressIndicator(color: Colors.white,)
                        : Center(child: Icon(Icons.send,size: 30,color: Colors.white,))),
                     
                    )
                ],
              ),
             
              const SizedBox(height: 20),
              Obx(() => Text(
                    result.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

