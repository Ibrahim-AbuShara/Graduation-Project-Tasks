import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post_class.dart';


Future<Predict> UserInfo(String sepalLengthCm,String sepalWidthCm,String petalLengthCm,String petalWidthCm) async {
  final response = await http.post(
    Uri.parse('https://shaggy-badger-34.loca.lt/api/ml'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'SepalLengthCm': sepalLengthCm,
      'SepalWidthCm': sepalWidthCm,
      'PetalLengthCm': petalLengthCm,
      'PetalWidthCm': petalWidthCm,
    }),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Predict.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to Post The Data.');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final TextEditingController sepalLengthController = TextEditingController();
  final TextEditingController sepalWidthController = TextEditingController();
  final TextEditingController petalLengthController = TextEditingController();
  final TextEditingController petalWidthController = TextEditingController();

  Future<Predict>? _user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_user == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: sepalLengthController,
          decoration: const InputDecoration(hintText: 'Enter sepal Length In Cm'),
        ),
        TextField(
          controller: sepalWidthController,
          decoration: const InputDecoration(hintText: 'Enter sepal Width In Cm'),
        ),
        TextField(
          controller: petalLengthController,
          decoration: const InputDecoration(hintText: 'Enter petal Length In Cm'),
        ),
        TextField(
          controller: petalWidthController,
          decoration: const InputDecoration(hintText: 'Enter petal Width In Cm'),
        ),
        ElevatedButton(
          onPressed: () async{
            setState(() {
              _user = UserInfo(sepalLengthController.text, sepalWidthController.text, petalLengthController.text, petalWidthController.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Predict> buildFutureBuilder() {
    return FutureBuilder<Predict>(
      future: _user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('The sepal Length Is : ${snapshot.data!.sepalLengthCm} And The sepal Width Is : ${snapshot.data!.sepalWidthCm}'
              'And The sepal Width Is : ${snapshot.data!.petalLengthCm} And The sepal Width Is : ${snapshot.data!.petalWidthCm}'
              'And The Predict species Is ${snapshot.data!.species}');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}