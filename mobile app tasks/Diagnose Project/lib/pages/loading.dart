import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'dart:io';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  var newdata = {
    'heat':''
  };
  main() async {
    final client = await Socket.connect('192.168.1.5', 5050);
    client.listen(
            (var data) => newdata['heat'] = (utf8.decode(data).trim().toString()),
        onDone: () {Navigator.pushReplacementNamed(context, '/dashboard', arguments: newdata); print(newdata['heat']);},
        onError: (e) { print('Got error $e'); client.close(); });
    client.write('connected to server');
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

