import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Imports necessary packages for the app

void main() {
  // Entry point of the Flutter app
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // State class managing the app's state
  TextEditingController controller =
      TextEditingController(); // Text editing controller for the name input field
  String name = ''; // String to store the entered name
  String estimatedAge = ''; // String to store the estimated age

  void giveNameGetAge() async {
    // Function to request an age estimation from the agify API
    var url = Uri.parse(
        'https://api.agify.io?name=$name'); // Creates a URL for the API request
    var response = await http.get(url); // Sends an HTTP GET request to the URL

    if (response.statusCode == 200) {
      // Checks if the request was successful
      var data = json.decode(response.body); // Parses the JSON response
      setState(() {
        // Updates the estimatedAge variable with the extracted age
        estimatedAge = data['age'].toString();
      });
    } else {
      print(
          'Failed to get age estimation'); // Prints an error message if the request failed
    }
  }

  void clearFields() {
    // Function to clear the input fields and reset the age estimation
    setState(() {
      // Updates the state to reflect the changes
      controller.clear(); // Clears the text field
      name = ''; // Resets the name and age variables
      estimatedAge = ''; // Resets the name and age variables
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jan der weiße (｢ ⊙Д⊙)｢',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        bottom: const PreferredSize(
            preferredSize: Size.zero,
            child: Text(
              '⋆ᘓમ૨ıડτന੨ડ⋆ ིྀ྇☃️',
              style: TextStyle(fontSize: 23, color: Colors.white),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              child: Image.asset(
                  'assets/images/Bildschirmfoto 2023-12-08 um 13.03.40.png'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            TextField(
              controller: controller,
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                hintText: 'Der weiße Jan verlangt nach einem Namen',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: giveNameGetAge,
                icon: Icon(Icons.search),
                label: Text(
                  'Frage den weißen Jan wie alt du bist ( ͡° ͜ʖ ͡° )',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 15),
            Text(
              'Der weiße Jan sagt: Das jemand mit dem Namen:$name , $estimatedAge Jahre alt sein muss!!!',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '╰༼=ಠਊಠ=༽╯',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: clearFields,
                child: Text(
                  'Den weißen Jan nochmal fragen!!!',
                  style: TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    ));
  }
}
