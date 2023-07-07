import 'package:flutter/material.dart';

class securityquestion extends StatefulWidget {
  const securityquestion({Key? key}) : super(key: key);

  @override
  State<securityquestion> createState() => _securityquestionState();
}

class _securityquestionState extends State<securityquestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // CircleAvatar(
          //   radius: 30,
          //   backgroundColor: Color(0xff4c505b),
          //   child: IconButton(
          //       onPressed: (){},
          //       icon: Icon(Icons.arrow_back)
          //   ),
          // ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          Container(
            padding: EdgeInsets.only(left: 35, top: 90),
            child: Text(
              'Security Questions',
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 35, top: 160),
            child: Text(
              "What's your favourite food?",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 35, top: 280),
            child: Text(
              "What's your hobby?",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 35, top: 400),
            child: Text(
              "What's your childhood name?",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25,
                  right: 35,
                  left: 35),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: '',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Back to Sign In',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
