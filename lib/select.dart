import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math' as math;
import 'music.dart';

class select extends StatefulWidget {
  var nums = [];
  select({Key? key, required this.nums}) : super(key: key);

  @override
  _selectState createState() => _selectState();
}

class _selectState extends State<select> {
  late var numnum = widget.nums;
  var checknum = [];
  String runmusic = 'moi';
  double average = 0;
  List<String> words = ['ロード中','どんな曲が出るんですかね？','長いな～','もうちょっと待ってね'];
  int i = 0;

  @override
  void initState() {
    super.initState();
    var random = math.Random();
    String word = words[0]; 
    numnum = widget.nums;
    print(numnum);

    for (int b = 0; b < numnum.length; b++){
      if(numnum[b] == 1){
        checknum.add(b);
      }
    }

    if(checknum.length != 1){
      if(checknum.length >= 1){
        for(int k = 0; k < checknum.length; k++){
          average = checknum[k] + average;
        }
        setState(() {
          average = average / checknum.length;
          runmusic = average.round().toString() + '.mp3';
        });
      }else{
        runmusic = random.nextInt(8).toString() + '.mp3';
      }
    }else{
      setState(() {
        runmusic = checknum[0].toString() + '.mp3';
      });
    }

    Future.delayed(Duration(seconds: random.nextInt(5) + 5), () {
      print(runmusic);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AudioPlayerPage(playmusic: runmusic)),
      );
    });
    Future.delayed(Duration(seconds: 3), (){
      setState(() {
        if (i < 3){
          i = i + 1;
          word = words[i];
        }else{
          i = 0;
          word = words[i];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: deviceSize / 4),
              child: Text(
                'ロード中',
                style: TextStyle(fontSize: 32),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: deviceSize / 15),
              child: Image(
                image: AssetImage('assets/sozai.gif'),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
