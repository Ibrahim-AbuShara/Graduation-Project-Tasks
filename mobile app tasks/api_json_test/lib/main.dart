import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'post_class.dart';


Future<Predict> UserInfo(String sepalLengthCm,String sepalWidthCm,String petalLengthCm,String petalWidthCm) async {
  final response = await http.post(
    Uri.parse('https://shaggy-fox-70.loca.lt/api/ml'),
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
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return Predict.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 CREATED response,
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
        primaryColor: Color.fromRGBO(199, 236, 238, 1.0),
      ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(223, 249, 251, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(149, 175, 192, 1.0),
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
          decoration: const InputDecoration(
              hintText: 'Enter sepal Length In Cm',
              fillColor: Color.fromRGBO(19, 15, 64, 1.0),
              hintStyle: TextStyle(color: Color.fromRGBO(19, 15, 64, 1.0))
          ),
          style: const TextStyle(color: Color.fromRGBO(19, 15, 64, 1.0)),
        ),
        TextField(
          controller: sepalWidthController,
          decoration: const InputDecoration(
              hintText: 'Enter sepal Width In Cm',
              fillColor: Color.fromRGBO(19, 15, 64, 1.0),
              hintStyle: TextStyle(color: Color.fromRGBO(19, 15, 64, 1.0))
          ),
          style: const TextStyle(color: Color.fromRGBO(19, 15, 64, 1.0)),
        ),
        TextField(
          controller: petalLengthController,
          decoration: const InputDecoration(
              hintText: 'Enter petal Length In Cm',
              fillColor: Color.fromRGBO(19, 15, 64, 1.0),
              hintStyle: TextStyle(color: Color.fromRGBO(19, 15, 64, 1.0))
          ),
          style: const TextStyle(color: Color.fromRGBO(19, 15, 64, 1.0)),
        ),
        TextField(
          controller: petalWidthController,
          decoration: const InputDecoration(
              hintText: 'Enter petal Width In Cm',
              fillColor: Color.fromRGBO(19, 15, 64, 1.0),
              hintStyle: TextStyle(color: Color.fromRGBO(19, 15, 64, 1.0))
          ),
          style: const TextStyle(color: Color.fromRGBO(19, 15, 64, 1.0)),
        ),
        ElevatedButton(
          style:  ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(
                149, 175, 192, 1.0)),
          ),
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
        var title;
        var image;
        if (snapshot.hasData) {
          if(snapshot.data!.species == 'Iris-versicolor'){
            title = 'Iris-versicolor';
            image = 'assets/versicolor.jpeg';
          }else if(snapshot.data!.species == 'Iris-setosa'){
            title = 'Iris-setosa';
            image = 'assets/setosa.jpeg';
          }else{
            title = 'Iris-virginica';
            image = 'assets/verginica.jpeg';
          }
          return Scaffold(
                backgroundColor: Color.fromRGBO(223, 249, 251, 1.0),
                body: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 500.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              title,
                              style: const TextStyle(
                                color: Color.fromRGBO(149, 175, 192, 1.0),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                          Image.asset(image),
                        ],
                      ),
                    ),
                  ),
                ),
              );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}