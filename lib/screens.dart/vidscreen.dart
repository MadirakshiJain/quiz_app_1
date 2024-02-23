import 'package:flutter/material.dart';

import 'package:quiz/screens.dart/player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VidScreen extends StatelessWidget {
  final List<String> videoUrls;
   VidScreen({super.key, required this.videoUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar:AppBar(
          automaticallyImplyLeading: false,
        title: Row(
          children: [
          IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Navigate back to previous page
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 133, 9, 154)),
                    ),
            Text("Popular Videos",
                style: TextStyle(fontWeight: FontWeight.w500,
             
                 fontSize: 25,color: Color.fromARGB(255, 160, 20, 184),)),
          ],
        ),
        backgroundColor: Colors.white,
      iconTheme: IconThemeData.fallback(),
      ),
      body: ListView.builder(
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
                     Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     Image.network(YoutubePlayer.getThumbnail(videoId: videoID!)),
                                     Icon(
                      Icons.play_circle,
                      size: 50,
                      color: Colors.blueGrey
                                     ),
                                   ],
                                 ),
                                 Divider( // Divider with white color
                  color: Colors.white,
                  thickness: 1, // Adjust thickness as needed
                ),
                   ],
                 ),
            
          );
        },
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