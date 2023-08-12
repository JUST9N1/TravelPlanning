import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'main.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }


  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {


  TextEditingController _textEditingController = TextEditingController();

  double _rating = 0;
  int _currentIndex = 2;
  BoxDecoration _boxDecoration = BoxDecoration();

  void _saveToFirebase() async {
    String content = _textEditingController.text;
    if (content.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('feedbackText').add({
          'content': content,
          'boxColor': _boxDecoration.color.toString(), // Save the color as a string
          // Save other properties of the box decoration as needed
        });
        _textEditingController.clear();
        print('Content saved to Firebase!');
      } catch (e) {
        print('Error saving content to Firebase: $e');
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },

        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users"),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/settings");
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 180, top: 0),
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Text(
                      "Give Us Feedback",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Feel Free To Share Your Feedback With Us',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'What do you think of our app?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star, color: Colors.amber),
                          half: Icon(Icons.star_half, color: Colors.amber),
                          empty: Icon(Icons.star_border, color: Colors.amber),
                        ),
                        onRatingUpdate: (rating) {
                          // Handle the user's rating here (e.g., send it to a backend)
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Tell Us About Your Experience",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter your experience...',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle the first button press
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Change the button background color
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.grey), // Change the button text color
                      ),
                      child: Text('Dismiss', style:
                        TextStyle(fontSize: 20,
                        ),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _saveToFirebase();
                        // Handle the second button press
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Change the button background color
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.grey), // Change the button text color
                      ),
                      child: Text('Send Feedback',
                        style:
                        TextStyle(fontSize: 20,
                        ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
