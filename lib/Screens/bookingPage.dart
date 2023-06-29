import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:intl/intl.dart';

class bookingPage extends StatefulWidget {
  const bookingPage({Key? key}) : super(key: key);

  @override
  State<bookingPage> createState() => _bookingPageState();
}

class _bookingPageState extends State<bookingPage>
    with TickerProviderStateMixin {
  TextEditingController name = TextEditingController();
  String result = "";
  TextEditingController number = new TextEditingController();
  TextEditingController email = new TextEditingController();

  Future<void> bookingSaved() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final data = {
        "name": name.text,
        "email": email.text,
        "number": number.text,
      };
      db.collection("booking").add(data).then((documentSnapshot) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Booked Successfully")));
        print("Added Data with ID: ${documentSnapshot.id}");
      });
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

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
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

  // TextEditingController _date= TextEditingController();

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);

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
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('Assets/images/bckg.png'),
                )),
              )),
              Positioned(
                  left: 0,
                  top: 20,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                      )
                    ],
                  )),
              Positioned(
                  top: 180,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 800,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: [
                        Row(
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
                            )
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
                                    onTap: () => _selectDate(
                                        context, _startDateController),
                                    decoration: InputDecoration(
                                      labelText: 'Select a Date ',
                                      border: OutlineInputBorder(),
                                      icon: Icon(Icons.calendar_today_rounded),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    controller: _endDateController,
                                    readOnly: true,
                                    onTap: () => _selectDate(
                                        context, _endDateController),
                                    decoration: InputDecoration(
                                      hintText: 'Select a Date',
                                      border: OutlineInputBorder(),
                                      icon: Icon(Icons.calendar_today_rounded),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'YOUR NAME',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
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
                                  return "Name must be in string";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                hintText: ' Enter you full name',
                                hintStyle: TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 17.0),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'E-MAIL ADDRESS',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                final RegExp emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                if (value == null || value.isEmpty) {
                                  return "Email is required";
                                }
                                if (!emailValid.hasMatch(value)) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                hintText: 'Enter you email address',
                                hintStyle: TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 17.0),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'PHONE NUMBER',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: number,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                hintText: '+977 Enter you phone number',
                                hintStyle: TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 17.0),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TabBar(
                                  // labelPadding: const EdgeInsets.only(left: 0, right: 0),
                                  controller: _tabController,
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,

                                  isScrollable: true,
                                  tabs: [
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
                            SizedBox(
                              height: 15,
                            ),
                            Row(
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
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        Color(0xFFFFF9C4), // Background color
                                    onPrimary: Colors
                                        .grey, // Text Color (Foreground color)
                                  ),
                                  onPressed: () {
                                    bookingSaved();
                                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Registered")));
                                  },
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'COMPLETE YOUR BOOKING WITH',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              width: 30,
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Color(0xFFFFF9C4), // Background color
                                      onPrimary: Colors
                                          .grey, // Text Color (Foreground color)
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Airlines",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  width: 100,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Color(0xFFFFF9C4), // Background color
                                      onPrimary: Colors
                                          .grey, // Text Color (Foreground color)
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Rental Cars",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  )),
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
    required this.number,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: decrement,
        ),
        Text(number.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: increment,
        ),
      ],
    );
  }
}
