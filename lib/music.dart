import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'choice.dart';
// import 'package:chewie/src/chewie_player.dart';

class AudioPlayerPage extends StatefulWidget {
  String playmusic;

  AudioPlayerPage({Key? key, required this.playmusic}) : super(key: key);

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.playmusic);
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.music_video, size: 256),
          ),
          Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    _controller.play();
                  },
                  icon: Icon(Icons.play_arrow), iconSize: 50
                ),
                IconButton(
                  onPressed: () {
                    _controller.pause();
                  },
                  icon: Icon(Icons.pause), iconSize: 50,
                  ),
                ],
              ),
               _ProgressText(controller: _controller),
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Choice())
                  );
                  }, 
                  child: Container(
                    width: 300,
                    height: 80,
                    child: Center(
                      child: Text('リセット',style: TextStyle(fontSize: 30)),
                    )
                  ),
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}

class _ProgressText extends StatefulWidget {
  final VideoPlayerController controller;

  const _ProgressText({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  __ProgressTextState createState() => __ProgressTextState();
}

class __ProgressTextState extends State<_ProgressText> {
  late VoidCallback _listener;

  __ProgressTextState() {
    _listener = () {
      setState(() {});
    };
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  @override
  void deactivate() {
    widget.controller.removeListener(_listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final String position = widget.controller.value.position.toString().substring(2,10);
    final String duration = widget.controller.value.duration.toString().substring(2,10);
    return Text('$position / $duration');
  }
}