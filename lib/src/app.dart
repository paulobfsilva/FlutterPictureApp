// Import Flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

// create a class that will be our custom widget extend the 'StatelessWidget' class
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter += 1;
    // make HTTP request
    final response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    final imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  // Stateless Widget is a widget that will never contain its own data or state.
  // Must define a build method that returns the widget that you want to build
  Widget build(context) {
    // return the widget
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
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
