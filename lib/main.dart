import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "COUNTODNW", home: MyHome()));
}

class MyHome extends StatelessWidget {
  const MyHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: const IconButton(
          icon: Icon(Icons.hourglass_top, color: Colors.white),
          onPressed: null,
        ),
        title: const Center(
          child: Text("LIGHTFALL COUNTDOWN", textAlign: TextAlign.start)),
        actions: const[
          IconButton(
            icon: Icon(Icons.hourglass_bottom, color: Colors.white),
            onPressed: null,
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/Lightfall_background.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white10,
                  width: 5.0
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)) 
                ),
              width: 300.0,
              height: 400.0,
              child: MyCountdown(),
              ),
            )
        ] 
      )
    );
  }
}

class MyCountdown extends StatefulWidget {
  const MyCountdown({ Key? key }) : super(key: key);

  @override
  _MyCountdownState createState() => _MyCountdownState();
}

class _MyCountdownState extends State<MyCountdown> {
  final DateTime lightfall = DateTime.utc(2023, 2, 22, 18, 0, 0).toLocal();
  var year, month, day, hours, minutes, seconds;
  void _timer(){
    Future.delayed(Duration(seconds: 1)).then((_){
      setState(() {
        var now = DateTime.now();
        var difference = lightfall.difference(now);
        year = difference.inDays;
        if(year < 365 ) { year = 0; } 
        else if (year < 730) { year = 1; }
        else { year = 2;}
        month = difference.inDays ~/ 30;
        day = difference.inDays % 30;
        hours = difference.inHours % 24;
        minutes = difference.inMinutes % 60;
        seconds = difference.inSeconds % 60;
      });
      _timer();
    });
  }
  Widget getCountdown(){
    return Column(children: [ 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$year',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 50.0, 
          ),
          ),
          Text('  $month',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50.0, 
          ),
          ),
          Text('  $day',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50.0, 
          ),
          )
        ]
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$hours',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 50.0, 
          ),
          ),
          Text('  $minutes',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50.0, 
          ),
          ),
          Text('  $seconds',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50.0, 
          ),
          )
        ]
      )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCountdown(),
        FloatingActionButton(
          onPressed: _timer,
          child: const Text("START",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
        )
      ],
    );
  }
}