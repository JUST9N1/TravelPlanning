//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:travelplanning/Screens/BookAirlines.dart';
// import 'package:travelplanning/Screens/DetailPage.dart';
// import 'package:travelplanning/Screens/rentCar.dart';
// import 'package:travelplanning/model/bookin_model.dart';
//
// import '../model/user_model.dart';
//
// class BookingPage extends StatefulWidget {
//   const BookingPage({Key? key}) : super(key: key);
//
//   @override
//   State<BookingPage> createState() => _BookingPageState();
// }
//
// class _BookingPageState extends State<BookingPage> with TickerProviderStateMixin {
//   TextEditingController name = TextEditingController();
//   String result = "";
//   TextEditingController number = TextEditingController();
//   TextEditingController email = TextEditingController();
//
//   Future<void> bookingSaved() async {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     try {
//       final startDate = _dateFormat.parse(_startDateController.text);
//       final endDate = _dateFormat.parse(_endDateController.text);
//       final data = {
//         "name": name.text,
//         "email": email.text,
//         "number": number.text,
//         "adult": number1,
//         "kid": number2,
//         "room": number3,
//         "startDate": Timestamp.fromDate(startDate),
//         "endDate": Timestamp.fromDate(endDate),
//       };
//       db.collection("booking").add(data).then((documentSnapshot) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text("Booked Successfully")));
//         print("Added Data with ID: ${documentSnapshot.id}");
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   int number1 = 0;
//   int number2 = 0;
//   int number3 = 0;
//
//   void incrementNumber1() {
//     setState(() {
//       number1++;
//     });
//   }
//
//   void decrementNumber1() {
//     setState(() {
//       number1--;
//     });
//   }
//
//   void incrementNumber2() {
//     setState(() {
//       number2++;
//     });
//   }
//
//   void decrementNumber2() {
//     setState(() {
//       number2--;
//     });
//   }
//
//   void incrementNumber3() {
//     setState(() {
//       number3++;
//     });
//   }
//
//   void decrementNumber3() {
//     setState(() {
//       number3--;
//     });
//   }
//
//   final TextEditingController _startDateController = TextEditingController();
//   final TextEditingController _endDateController = TextEditingController();
//   final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
//   List<BookingModel> bookingList = []; // Add this line
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Fetch data from Firestore on widget initialization
//   }
//
//   Future<void> fetchData() async {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot = await db.collection('booking').get();
//
//       List<BookingModel> bookings = [];
//
//       querySnapshot.docs.forEach((doc) {
//         BookingModel booking = BookingModel.fromMap(doc.data());
//         bookings.add(booking);
//       });
//
//       setState(() {
//         bookingList = bookings; // Update the state with the fetched bookings
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
//     final DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2021),
//       lastDate: DateTime(2030),
//     );
//
//     if (selectedDate != null) {
//       setState(() {
//         controller.text = _dateFormat.format(selectedDate);
//       });
//     }
//   }
//
//   final TextEditingController _date = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     TabController tabController = TabController(length: 4, vsync: this);
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: SizedBox(
//           width: double.maxFinite,
//           height: double.maxFinite,
//           child: Stack(
//             children: [
//               Positioned(
//                 child: Container(
//                   width: double.maxFinite,
//                   height: 300,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('img/bookingImage.png'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 top: 20,
//                 child: Column(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(builder: (context) => const DetailPage(documentId: '')),
//                         );
//                       },
//                       icon: const Icon(Icons.arrow_back),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 180,
//                 child: Container(
//                   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
//                   width: MediaQuery.of(context).size.width,
//                   height: 1000,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'CHECK-IN',
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           Text(
//                             'CHECK-OUT',
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: TextField(
//                                   controller: _startDateController,
//                                   readOnly: true,
//                                   onTap: () => _selectDate(context, _startDateController),
//                                   decoration: const InputDecoration(
//                                     labelText: 'Select a Date ',
//                                     border: OutlineInputBorder(),
//                                     icon: Icon(Icons.calendar_today_rounded),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 10),
//                               Expanded(
//                                 child: TextField(
//                                   controller: _endDateController,
//                                   readOnly: true,
//                                   onTap: () => _selectDate(context, _endDateController),
//                                   decoration: const InputDecoration(
//                                     hintText: 'Select a Date',
//                                     border: OutlineInputBorder(),
//                                     icon: Icon(Icons.calendar_today_rounded),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const Text(
//                             'YOUR NAME',
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             controller: name,
//                             keyboardType: TextInputType.name,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "Name is required";
//                               }
//                               if (value != String) {
//                                 return "Name must be a string";
//                               }
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                               prefixIcon: Icon(
//                                 Icons.person,
//                                 color: Colors.black,
//                                 size: 22.0,
//                               ),
//                               hintText: ' Enter your full name',
//                               hintStyle: TextStyle(
//                                 fontFamily: 'WorkSansSemiBold',
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const Text(
//                             'E-MAIL ADDRESS',
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             controller: email,
//                             keyboardType: TextInputType.emailAddress,
//                             validator: (value) {
//                               final RegExp emailValid = RegExp(
//                                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
//                               );
//                               if (value == null || value.isEmpty) {
//                                 return "Email is required";
//                               }
//                               if (!emailValid.hasMatch(value)) {
//                                 return "Please enter a valid email";
//                               }
//                               return null;
//                             },
//                             decoration: const InputDecoration(
//                               prefixIcon: Icon(
//                                 Icons.email,
//                                 color: Colors.black,
//                                 size: 22.0,
//                               ),
//                               hintText: 'Enter your email address',
//                               hintStyle: TextStyle(
//                                 fontFamily: 'WorkSansSemiBold',
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const Text(
//                             'PHONE NUMBER',
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             controller: number,
//                             decoration: const InputDecoration(
//                               prefixIcon: Icon(
//                                 Icons.phone,
//                                 color: Colors.black,
//                                 size: 22.0,
//                               ),
//                               hintText: '+977 Enter your phone number',
//                               hintStyle: TextStyle(
//                                 fontFamily: 'WorkSansSemiBold',
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: TabBar(
//                                 controller: tabController,
//                                 labelColor: Colors.black,
//                                 unselectedLabelColor: Colors.grey,
//                                 isScrollable: true,
//                                 tabs: const [
//                                   Tab(
//                                     text: "Hotels",
//                                   ),
//                                   Tab(text: "Budget"),
//                                   Tab(text: "Standard"),
//                                   Tab(text: "5-Star"),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 20, right: 10),
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Adults',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Kids',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 Text(
//                                   'No. of rooms',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 IncrementDecrementBox(
//                                   number: number1,
//                                   increment: incrementNumber1,
//                                   decrement: decrementNumber1,
//                                 ),
//                                 IncrementDecrementBox(
//                                   number: number2,
//                                   increment: incrementNumber2,
//                                   decrement: decrementNumber2,
//                                 ),
//                                 IncrementDecrementBox(
//                                   number: number3,
//                                   increment: incrementNumber3,
//                                   decrement: decrementNumber3,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Column(
//                             children: [
//                               const Text(
//                                 'Choose your travelling preferences: ',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w100,
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       foregroundColor: Colors.grey,
//                                       backgroundColor: const Color(0xFFFFF9C4),
//                                       minimumSize: const Size(150, 50),
//                                     ),
//                                     onPressed: () {
//                                       Navigator.of(context).pushReplacement(
//                                         MaterialPageRoute(builder: (context) => const BookAirlines()),
//                                       );
//                                     },
//                                     child: const Text(
//                                       "Airlines",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 50),
//                                   ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       foregroundColor: Colors.grey,
//                                       backgroundColor: const Color(0xFFFFF9C4),
//                                       minimumSize: const Size(150, 50),
//                                     ),
//                                     onPressed: () {
//                                       Navigator.of(context).pushReplacement(
//                                         MaterialPageRoute(builder: (context) => const RentCar()),
//                                       );
//                                     },
//                                     child: const Text(
//                                       "Rental Cars",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 height: 50,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     foregroundColor: Colors.grey,
//                                     backgroundColor: const Color(0xFFFFF9C4),
//                                   ),
//                                   onPressed: () {
//                                     bookingSaved();
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(content: Text("Registered")),
//                                     );
//                                   },
//                                   child: const Text(
//                                     "Book Now",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               Row(
//                                 children: [
//                                   ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       foregroundColor: Colors.grey,
//                                       backgroundColor: const Color(0xFFFFF9C4),
//                                       minimumSize: const Size(150, 50),
//                                     ),
//                                     onPressed: () {
//                                       // TODO: Implement update functionality
//                                     },
//                                     child: const Text(
//                                       "Update",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 30),
//                                   ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       foregroundColor: Colors.grey,
//                                       backgroundColor: const Color(0xFFFFF9C4),
//                                       minimumSize: const Size(150, 50),
//                                     ),
//                                     onPressed: () {
//                                       // TODO: Implement delete functionality
//                                     },
//                                     child: const Text(
//                                       "Delete Booking",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//
//
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class IncrementDecrementBox extends StatelessWidget {
//   final int number;
//   final VoidCallback increment;
//   final VoidCallback decrement;
//
//   const IncrementDecrementBox({
//     Key? key,
//     required this.number,
//     required this.increment,
//     required this.decrement,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           icon: const Icon(Icons.remove),
//           onPressed: decrement,
//         ),
//         Text(number.toString()),
//         IconButton(
//           icon: const Icon(Icons.add),
//           onPressed: increment,
//         ),
//       ],
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelplanning/Screens/BookAirlines.dart';
import 'package:travelplanning/Screens/DetailPage.dart';
import 'package:travelplanning/Screens/rentCar.dart';
import 'package:travelplanning/model/bookin_model.dart';

import '../model/user_model.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with TickerProviderStateMixin {
  TextEditingController name = TextEditingController();
  String result = "";
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> bookingSaved() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final startDate = _dateFormat.parse(_startDateController.text);
      final endDate = _dateFormat.parse(_endDateController.text);
      final data = {
        "name": name.text,
        "email": email.text,
        "number": number.text,
        "adult": number1,
        "kid": number2,
        "room": number3,
        "startDate": Timestamp.fromDate(startDate),
        "endDate": Timestamp.fromDate(endDate),
      };
    String userId = FirebaseAuth.instance.currentUser!.uid;

    QuerySnapshot<Map<String, dynamic>> bookingSnapshot =
    await db.collection("booking").where("userId", isEqualTo: userId).get();

    if (bookingSnapshot.docs.isNotEmpty) {
    // Update the existing document with the new data
    String documentId = bookingSnapshot.docs[0].id;
    await db.collection("booking").doc(documentId).update(data);
    } else {
    // Add a new document if it doesn't exist for the current user
    await db.collection("booking").add(data);
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Booked Successfully")));
    } catch (e) {
    print(e);
    }

  }

  int number1 = 0;
  int number2 = 0;
  int number3 = 0;

  void incrementNumber1() {
    setState(() {
      number1++;
    });
  }

  void decrementNumber1() {
    setState(() {
      number1--;
    });
  }

  void incrementNumber2() {
    setState(() {
      number2++;
    });
  }

  void decrementNumber2() {
    setState(() {
      number2--;
    });
  }

  void incrementNumber3() {
    setState(() {
      number3++;
    });
  }

  void decrementNumber3() {
    setState(() {
      number3--;
    });
  }

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  List<BookingModel> bookingList = []; // Add this line

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data from Firestore on widget initialization
  }

  Future<void> fetchData() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await db.collection('booking').get();

      List<BookingModel> bookings = [];

      querySnapshot.docs.forEach((doc) {
        BookingModel booking = BookingModel.fromMap(doc.data());
        bookings.add(booking);
      });

      setState(() {
        bookingList = bookings; // Update the state with the fetched bookings
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      setState(() {
        controller.text = _dateFormat.format(selectedDate);
      });
    }
  }

  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/bookingImage.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 20,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const DetailPage(documentId: '')),
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 180,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 1000,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'CHECK-IN',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'CHECK-OUT',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _startDateController,
                                  readOnly: true,
                                  onTap: () => _selectDate(context, _startDateController),
                                  decoration: const InputDecoration(
                                    labelText: 'Select a Date ',
                                    border: OutlineInputBorder(),
                                    icon: Icon(Icons.calendar_today_rounded),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: _endDateController,
                                  readOnly: true,
                                  onTap: () => _selectDate(context, _endDateController),
                                  decoration: const InputDecoration(
                                    hintText: 'Select a Date',
                                    border: OutlineInputBorder(),
                                    icon: Icon(Icons.calendar_today_rounded),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'YOUR NAME',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: name,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name is required";
                              }
                              if (value != String) {
                                return "Name must be a string";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: ' Enter your full name',
                              hintStyle: TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'E-MAIL ADDRESS',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              final RegExp emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              );
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              if (!emailValid.hasMatch(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: 'Enter your email address',
                              hintStyle: TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'PHONE NUMBER',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: number,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: '+977 Enter your phone number',
                              hintStyle: TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                controller: tabController,
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                isScrollable: true,
                                tabs: const [
                                  Tab(
                                    text: "Hotels",
                                  ),
                                  Tab(text: "Budget"),
                                  Tab(text: "Standard"),
                                  Tab(text: "5-Star"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Adults',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Kids',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'No. of rooms',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IncrementDecrementBox(
                                  number: number1,
                                  increment: incrementNumber1,
                                  decrement: decrementNumber1,
                                ),
                                IncrementDecrementBox(
                                  number: number2,
                                  increment: incrementNumber2,
                                  decrement: decrementNumber2,
                                ),
                                IncrementDecrementBox(
                                  number: number3,
                                  increment: incrementNumber3,
                                  decrement: decrementNumber3,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              const Text(
                                'Choose your travelling preferences: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.grey,
                                      backgroundColor: const Color(0xFFFFF9C4),
                                      minimumSize: const Size(150, 50),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => const BookAirlines()),
                                      );
                                    },
                                    child: const Text(
                                      "Airlines",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 50),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.grey,
                                      backgroundColor: const Color(0xFFFFF9C4),
                                      minimumSize: const Size(150, 50),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => const rentCar()),
                                      );
                                    },
                                    child: const Text(
                                      "Rental Cars",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.grey,
                                    backgroundColor: const Color(0xFFFFF9C4),
                                  ),
                                  onPressed: () {
                                    bookingSaved();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Registered")),
                                    );
                                  },
                                  child: const Text(
                                    "Book Now",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.grey,
                                      backgroundColor: const Color(0xFFFFF9C4),
                                      minimumSize: const Size(150, 50),
                                    ),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Updated Successfully")),
                                      );
                                      // TODO: Implement update functionality
                                    },
                                    child: const Text(
                                      "Update",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),


                                  const SizedBox(width: 30),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.grey,
                                      backgroundColor: const Color(0xFFFFF9C4),
                                      minimumSize: const Size(150, 50),
                                    ),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Deleted Successfully")),
                                      );
                                      // TODO: Implement delete functionality
                                    },
                                    child: const Text(
                                      "Delete Booking",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IncrementDecrementBox extends StatelessWidget {
  final int number;
  final VoidCallback increment;
  final VoidCallback decrement;

  const IncrementDecrementBox({
    Key? key,
    required this.number,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: decrement,
        ),
        Text(number.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: increment,
        ),
      ],
    );
  }
}
