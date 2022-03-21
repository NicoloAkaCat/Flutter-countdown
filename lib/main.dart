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
              child: const MyCountdown(),
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
    Future.delayed(const Duration(seconds: 1)).then((_){
      setState(() {
        var now = DateTime.now();
        var difference = lightfall.difference(now);
        year = difference.inDays;
        if(year < 365 ) { year = 0; } 
        else if (year < 730) { year = 1; }
        else { year = 2;}
        if(year < 10) year = year.toString().padLeft(2, '0');
        month = difference.inDays ~/ 30;
        if(month < 10) month = month.toString().padLeft(2, '0');
        day = difference.inDays % 30;
        if(day < 10) day = day.toString().padLeft(2, '0');
        hours = difference.inHours % 24;
        if(hours < 10) hours = hours.toString().padLeft(2, '0');
        minutes = difference.inMinutes % 60;
        if(minutes < 10) minutes = minutes.toString().padLeft(2, '0');
        seconds = difference.inSeconds % 60;
        if(seconds < 10) seconds = seconds.toString().padLeft(2, '0');
      });
      _timer();
    });
  }
  Widget getCountdown(){
    return Column(children: [ 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Text('$year',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 55.0, 
              ),
            ),
            const Text("YEARS",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ]),
          const Spacer(),
          Column(children: [
            Text('$month',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 55.0, 
              ),
            ),
            const Text("MONTHS",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ]),
          const Spacer(),
          Column(children: [
            Text('$day',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 55.0, 
              ),
            ),
            const Text("DAYS",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ])
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Text('$hours',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 55.0
              ),
            ),
            const Text("HOURS",
              style: TextStyle(
                color: Colors.white
              ),
            )
          ],),
          const Spacer(),
          Column(children: [
            Text('$minutes',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 55.0
              ),
            ),
            const Text("MINUTES",
              style: TextStyle(
                color: Colors.white
              ),
            )
          ],),
          const Spacer(),
          Column(children: [
            Text('$seconds',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 55.0
              ),
            ),
            const Text("SECONDS",
              style: TextStyle(
                color: Colors.white
              ),
            )
          ],)
        ],
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCountdown(),
        FloatingActionButton.large(
          onPressed: _timer,
          child: const Text("START",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.white,
        )
      ],
    );
  }
}