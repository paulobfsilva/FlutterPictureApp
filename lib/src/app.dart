// Import Flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

// create a class that will be our custom widget extend the 'StatelessWidget' class
class AppState extends State<App> {
  int counter = 0;

  void fetchImage() {
    counter += 1;
    // make HTTP request
    get('https://jsonplaceholder.typicode.com/photos/$counter');
  }

  // Stateless Widget is a widget that will never contain its own data or state.
  // Must define a build method that returns the widget that you want to build
  Widget build(context) {
    // return the widget
    return MaterialApp(
      home: Scaffold(
        body: Text('$counter'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage, //function reference
        ),
        appBar: AppBar(
          title: Text('Lets see some images'),
          backgroundColor: Colors.blueGrey[900],
        ),
      ),
    );
  }
}
