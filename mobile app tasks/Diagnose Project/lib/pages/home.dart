import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/medical2.png'),
        fit: BoxFit.cover,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 25.0, 0, 20.0),
            child: Text.rich(
              TextSpan(
                text: 'Welcome To ', // default text style
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Diagnose ', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(78, 144, 255, 1.0),
                  )),
                  TextSpan(text: 'App'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue[700],
                  backgroundColor: Colors.transparent,
                  side: BorderSide(
                    color: Color.fromRGBO(0, 0, 255, 1),
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 10.0),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/loading');
                },
                child: const Text(
                    'Get Started',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ]
      ),
    ),
    ),
    );
  }
}