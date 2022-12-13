import 'package:flutter/material.dart';
import 'select.dart';

class Choice extends StatefulWidget{
  const Choice({Key? key}) : super(key: key);

  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {

  @override
  void initState() {
    flagnum = [0,0,0,0,0,0,0,0,0,0];
    flags = [false,false,false,false,false,false,false,false,false,false];
  }

  var flagnum = [0,0,0,0,0,0,0,0,0,0];
  List<bool> flags = [false,false,false,false,false,false,false,false,false,false];
  @override
  Widget build(BuildContext context) {
  final double deviceSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: deviceSize / 5),
                child: const Text(
                  '今の気分は??',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: deviceSize / 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonPrint('心地よい', 0, deviceSize),
                  ButtonPrint('楽しく', 1, deviceSize),
                  ButtonPrint('にぎやかな', 2, deviceSize)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: deviceSize / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonPrint('感動する', 3,deviceSize),
                  ButtonPrint('静かな', 4,deviceSize),
                  ButtonPrint('勢いのある', 5,deviceSize)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: deviceSize / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonPrint('おしゃれに', 6,deviceSize),
                  ButtonPrint('気分よく', 7,deviceSize),
                  ButtonPrint('ららんらんらん', 8,deviceSize)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: deviceSize / 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  elevation: 10,
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => select(nums: flagnum))
                  );
                },
                child: const Text('音楽ページへ')
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ButtonPrint(String TextString, int num, double size){

    return Container(
      width: size / 7,
      height: size / 20,
      child: ElevatedButton(
        onPressed: (){
          setState(() {
            flags[num] = !flags[num];
            flags[num] ?  flagnum[num] = 1 : flagnum[num] = 0;
            print(flagnum[num].toString());
          });
        },
        style: ElevatedButton.styleFrom(
          primary: flags[num] ? Colors.black : Colors.blue
        ),
        child: Text(TextString),
    ));
  }
}
