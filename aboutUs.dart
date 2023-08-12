import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class aboutUs extends StatefulWidget {
  const aboutUs({Key? key}) : super(key: key);

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  int _currentIndex = 3;

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
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(0),
              ),
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Row(
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Our Associates',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Leading The Travel \nIndustry Since Decade',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Image.asset(
                                "assets/images/ss.jpg",
                                width: 170,
                                height: 90,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Contact Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.phone_android,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '9805498076,9860567747',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Kathmandu, Nepal',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Sun-Fri 10-18 Sat CLOSED',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    launch('https://www.facebook.com');
                                    // Handle the click event
                                    // Example: Open Facebook URL
                                  },
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/fb.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 0),
                                GestureDetector(
                                  onTap: () {
                                    launch('https://www.linkedin.com');
                                    // Handle the click event
                                    // Example: Open LinkedIn URL
                                  },
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/linkedin.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    launch('https://www.twitter.com');
                                    // launch('https://twitter.com/i/flow/login?redirect_after_login=%2Flogin%3Flang%3Den');
                                    // Handle the click event
                                    // Example: Open Twitter URL
                                  },
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/twit.jpg",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 0),
                                GestureDetector(
                                  onTap: () {
                                    launch('https://www.instagram.com');
                                    // Handle the click event
                                    // Example: Open Instagram URL
                                  },
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/ig.jpg",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
