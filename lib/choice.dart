import 'package:flutter/material.dart';

class Choice extends StatefulWidget{
  const Choice({Key? key}) : super(key: key);

  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
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
                  'Choice',
                  style: TextStyle(
                    fontSize: 60,
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('あ')
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('い')
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('う')
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: deviceSize / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('え')
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('お')
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('か')
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: deviceSize / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('き')
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('く')
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(125, 50),
                      elevation: 10,
                    ),
                    onPressed: (){
                      print("button press !!");
                    },
                    child: Text('け')
                  ),
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
                  print("button press !!");
                },
                child: const Text('音楽ページへ')
              ),
            ),
          ],
        ),
      ),
    );
  }
}