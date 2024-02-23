import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PLayerScreen extends StatefulWidget {
  const PLayerScreen({super.key, required this.videoId});

  final String videoId;

  @override
  State<PLayerScreen> createState() => _PLayerScreenState();
}

class _PLayerScreenState extends State<PLayerScreen> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: const  YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
    ),
);
@override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromARGB(255, 160, 20, 184),
    
      // appBar: AppBar(title: const Text("Player")),
      body: SingleChildScrollView(
        child: Column(
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
           ],
         ),
                      SizedBox(
                        height: 15,
                      ),
            Container(
              margin: EdgeInsets.only(top: 80,left:15,right: 15),
            
              child: YoutubePlayer(controller: _controller)),
          ],
        ),
      ),
    );
  }
}