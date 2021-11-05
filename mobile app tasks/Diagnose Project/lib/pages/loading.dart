import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void fakesync() async{
    await Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/dashboard');
    });
  }

  @override
  void initState(){
    super.initState();
    fakesync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SpinKitPouringHourGlassRefined(
        color: Colors.blue,
        size: 50.0,
      ),
    );
  }
}

