// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// class faqs extends StatefulWidget {
//   const faqs({Key? key}) : super(key: key);
//
//   @override
//   State<faqs> createState() => _faqsState();
// }
//
// class _faqsState extends State<faqs> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.arrow_back,
//                       size: 30,
//                       color: Colors.black,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 10, right: 180, top: 0),
//                 child: Text(
//                   "faqs",
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(
//                   left: 0,
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Text(
//                       "1. What should I do if I encounter a problem during my trip?",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       padding: EdgeInsets.all(10.0),
//                       child: Text(
//                         "Ans: If you encounter any issues during your trip, please contact our customer support team right away. You can reach us through phone support. We are here to help you resolve the problem promptly.",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Text(
//                       "2. How can I search for flights/hotels/activities? ",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       padding: EdgeInsets.all(10.0),
//                       child: Text(
//                         "Ans: To search for flights, hotels, or activities, go to the respective section of the app. Enter your desired destination, travel dates, and any other relevant information. Click on the 'Search' button, and the app will display available options based on your criteria.",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     Text(
//                       "3. How can I book a flight, hotel, or vacation package? ",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       padding: EdgeInsets.all(10.0),
//                       child: Text(
//                         "Ans: Once you have found the desired option, click on the 'Let’s go' button. You will be guided through the booking process, where you'll need to provide required information.",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class faqs extends StatefulWidget {
  const faqs({Key? key}) : super(key: key);

  @override
  State<faqs> createState() => _faqsState();
}

class _faqsState extends State<faqs> {
  List<Item> _items = [
    Item(
      question: '1. What should I do if I encounter a problem during my trip?',
      answer:
      'If you encounter any issues during your trip, please contact our customer support team right away. You can reach us through phone support. We are here to help you resolve the problem promptly.',
      isExpanded: false,
    ),
    Item(
      question: '2. How can I search for flights/hotels/activities?',
      answer:
      'To search for flights, hotels, or activities, go to the respective section of the app. Enter your desired destination, travel dates, and any other relevant information. Click on the "Search" button, and the app will display available options based on your criteria.',
      isExpanded: false,
    ),
    Item(
      question: '3. How can I book a flight, hotel, or vacation package?',
      answer:
      'Once you have found the desired option, click on the "Let’s go" button. You will be guided through the booking process, where you\'ll need to provide required information.',
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 180, top: 0),
                child: Text(
                  "FAQS",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildExpansionPanelList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpansionPanelList() {
    return _items.map<Widget>((Item item) {
      return ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.all(0),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            item.isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  item.question,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Text(
                item.answer,
                style: TextStyle(fontSize: 20),
              ),
            ),
            isExpanded: item.isExpanded,
          ),
        ],
      );
    }).toList();
  }
}

class Item {
  String question;
  String answer;
  bool isExpanded;

  Item({
    required this.question,
    required this.answer,
    required this.isExpanded,
  });
}


