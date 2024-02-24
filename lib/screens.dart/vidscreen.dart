import 'package:flutter/material.dart';

import 'package:quiz/screens.dart/player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VidScreen extends StatelessWidget {
  final List<String> videoUrls;
   VidScreen({super.key, required this.videoUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 160, 20, 184),
      appBar:AppBar(
        backgroundColor: Color.fromARGB(255, 160, 20, 184), 
          automaticallyImplyLeading: false,
    
        title: Row(
          children: [
          IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Navigate back to previous page
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
            Text("Popular Videos",
                style: TextStyle(fontWeight: FontWeight.w500,
             
                 fontSize: 25,color: Colors.white,)),
          ],
        ),
        
      iconTheme: IconThemeData.fallback(),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: videoUrls.length,
          itemBuilder: (context, index) {
            final videoID = YoutubePlayer.convertUrlToId(videoUrls[index]);
        
            return 
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PLayerScreen(videoId: videoID)));
              },
                child:
                   Column(
                     children: [
                       Container(
                       
                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Color.fromARGB(  255, 220, 126, 243)
                      ),
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * (2.5 / 100),
                          10,
                          MediaQuery.of(context).size.width * (2.5 / 100),
                          10),
                         child: Column(
                           children: [
                             Image.network(YoutubePlayer.getThumbnail(videoId: videoID!)),
                             SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PLayerScreen(videoId: videoID)));
                              },
                              child: Text('Watch Now',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 160, 20, 184),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)))
                           ],
                         ),
                       ),
                                   Divider( // Divider with white color
                    
                    thickness: 1, // Adjust thickness as needed
                  ),
                     ],
                   ),
              
            );
          },
        ),
      ),
    );
  }

  Widget thubmNail() {
    return Container(
  
      height: 200,
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      color: Color.fromARGB(255, 160, 20, 184),
      child: const Center(
        child: Text("THUMBNAIL"),
      ),
    );
  }
}