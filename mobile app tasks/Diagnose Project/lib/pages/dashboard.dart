import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    dynamic heat = ModalRoute.of(context)!.settings.arguments;
    print(heat['heat']);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 235, 238, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('Diagnose'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Material(
                      elevation: 10.0,
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      child: SizedBox(
                        height: 150.0,
                        child: ListTile(
                          minVerticalPadding: 20.0,
                          contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          tileColor: const Color.fromRGBO(255, 255, 255, 1.0),
                          title: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                            child: Text(
                              'Body Temperature',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          leading: const Icon(
                            FontAwesomeIcons.fireAlt,
                            color: Color.fromRGBO(205, 10, 10, 1.0),
                            size: 40.0,
                          ),
                          subtitle: Text(
                            heat['heat'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: Material(
                      elevation: 10.0,
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      child: SizedBox(
                        height: 150.0,
                        child: ListTile(
                          minVerticalPadding: 20.0,
                          contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          tileColor: const Color.fromRGBO(255, 255, 255, 1.0),
                          title: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                            child: Text(
                              'heart beat rate',
                              style:  TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          leading: const Icon(
                            FontAwesomeIcons.heartbeat,
                            color: Color.fromRGBO(205, 10, 10, 1.0),
                            size: 40.0,
                          ),
                          subtitle: Text(
                            heat['heat'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Material(
                      elevation: 10.0,
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      child: SizedBox(
                        height: 150.0,
                        child: ListTile(
                          minVerticalPadding: 20.0,
                          contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          tileColor: const Color.fromRGBO(255, 255, 255, 1.0),
                          title: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                            child: Text(
                              'Body Temperature',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          leading: const Icon(
                            FontAwesomeIcons.fireAlt,
                            color: Color.fromRGBO(205, 10, 10, 1.0),
                            size: 40.0,
                          ),
                          subtitle: Text(
                            heat['heat'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: Material(
                      elevation: 10.0,
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      child: SizedBox(
                        height: 150.0,
                        child: ListTile(
                          minVerticalPadding: 20.0,
                          contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          tileColor: const Color.fromRGBO(255, 255, 255, 1.0),
                          title: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                            child: Text(
                              'heart beat rate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          leading: const Icon(
                            FontAwesomeIcons.heartbeat,
                            color: Color.fromRGBO(205, 10, 10, 1.0),
                            size: 40.0,
                          ),
                          subtitle: Text(
                            heat['heat'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: SizedBox(
                        height: 150.0,
                        child: ListTile(
                          minVerticalPadding: 20.0,
                          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          tileColor: Color.fromRGBO(255, 255, 255, 1.0),
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                            child: Text(
                              'heart beat rate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.heartbeat,
                            color: Color.fromRGBO(205, 10, 10, 1.0),
                            size: 40.0,
                          ),
                          subtitle: Text(
                            '40',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: SizedBox(
                        height: 150.0,
                        child: ListTile(
                          minVerticalPadding: 20.0,
                          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          tileColor: Color.fromRGBO(255, 255, 255, 1.0),
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                            child: Text(
                              'heart beat rate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.heartbeat,
                            color: Color.fromRGBO(205, 10, 10, 1.0),
                            size: 40.0,
                          ),
                          subtitle: Text(
                            '40',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 5.0,
                      primary: Colors.white,
                      backgroundColor: Colors.blue[700],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 10.0),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                    child: const Text(
                      'Diagnose',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

