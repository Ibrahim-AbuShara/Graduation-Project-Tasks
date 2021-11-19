import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'dart:io';

class loading extends StatefulWidget {

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  var newdata = [];

  main() async {
    final client = await Socket.connect('192.168.1.5', 5050);
    client.listen(
            (var data) => newdata.add(utf8.decode(data).toString()),
        onDone: () { print(newdata[0]); print(newdata); Navigator.pushReplacementNamed(context, '/dashboard', arguments: newdata);},
        onError: (e) { print('Got error $e'); client.close(); });
    client.write('main done');
    client.close();
  }

  @override
  void initState(){
    super.initState();
    main();
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

