import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookAirlines extends StatefulWidget {
  const BookAirlines({Key? key}) : super(key: key);

  @override
  State<BookAirlines> createState() => _BookAirlinesState();
}



class _BookAirlinesState extends State<BookAirlines> {
  List<String> _locations = ['Kathmandu', 'Pokhara', 'Dharan', 'Birgunj']; // Option 2
  List<String> _class = ['CLASS','First','Business', 'Economy'];
  List<String> _passengers = ['PASSENGERS','1','2','3','4','5'];

  String? _selectedLocationFrom; // Option 2
  String? _selectedLocationTo; // Option 2
  String? _selectedclass;
  String? _selectedpassengers;


  @override
  void initState() {
    // TODO: implement initState
    _selectedLocationFrom = _locations.first;
    _selectedLocationTo = _locations.first;
    _selectedclass = _class.first;
    _selectedpassengers = _passengers.first;

    super.initState();
  }
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void saveData() async{
    final data = {
      "from": _selectedLocationFrom,
      "to": _selectedLocationTo,
      "date": selectedDate,
      "class": _selectedclass,
      "passengers": _selectedpassengers
    };
  //   data
    try{
      await FirebaseFirestore.instance.collection("airlines").add(data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data saved")));

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:  double.infinity,
        height:  920,
        decoration:  BoxDecoration (
          color:  Colors.white,
        ),


        child:
        Stack(
          children:  [
            Container(
              //width: double.infinity,
              width:  428,
              height:  528,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/airplane.png'),
                      fit: BoxFit.cover
                  )),
            ),

            Positioned(
              left:  0,
              top:  10,
              child:

              Align(
                child:
                SizedBox(
                  width:  428,
                  height:  528,
                ),
              ),
            ),

            //stack white box
            Positioned(
              left:  0,
              top:  333,
              right: 0,
              child:
              Align(
                child:
                SizedBox(
                  width:  428,
                  height:  577,
                  child:
                  Container(
                    decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(30),
                      color:  Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left:  46,
              top:  367,
              child:
              Container(
                width:  388,
                height:  520,
                child:
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      width:  double.infinity,
                      height:  57,
                      child:
                      Stack(

                        children:  [
                          Positioned(
                            left:  0,
                            top:  0,
                            child:
                            Align(
                              child:
                              SizedBox(
                                width:  0,
                                height:  0,

                              ),
                            ),
                          ),


                          Positioned(
                            left:  25,
                            top:  -8,
                            child:
                            Align(
                              child:
                              SizedBox(
                                width:  55,
                                height:  45,
                                child:
                                Text(
                                  'From',
                                  textAlign:  TextAlign.start,
                                  style:  TextStyle(
                                    fontSize:  20,
                                    fontWeight:  FontWeight.w500,
                                    height:  1.38,
                                    color:  Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),


                          DropdownButton(
                            hint: Text('Please choose a location',
                              style:  TextStyle(
                                fontSize:  23,
                              ),
                            ), // Not necessary for Option 1
                            value: _selectedLocationFrom,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocationFrom = newValue;
                              });
                            },
                            items: _locations.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),


                    Container(
                      padding:  EdgeInsets.fromLTRB(0, 35, 0, 0),
                      width:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // autogroupme9zxmy (JfSFbhS4VZCdcWgfRTme9Z)
                            margin:  EdgeInsets.fromLTRB(0, 0, 0, 25),
                            width:  336,
                            height:  57,
                            child:
                            Stack(
                              children:  [
                                Positioned(
                                  left:  0,
                                  top:  0,
                                  child:
                                  Align(
                                    child:
                                    SizedBox(
                                      width:  336,
                                      height:  57,
                                      // child:
                                      // Image.network(
                                      //   [Image url]
                                      //   width:  336,
                                      //   height:  57,
                                      // ),
                                    ),
                                  ),
                                ),


                                Positioned(
                                  left:  27,
                                  top:  -9,
                                  child:
                                  Align(
                                    child:
                                    SizedBox(
                                      width:  30,
                                      height:  35,

                                      child:
                                      Text(
                                        'To',
                                        textAlign:  TextAlign.start,
                                        style:  TextStyle(
                                          fontSize:  20,
                                          fontWeight:  FontWeight.w500,
                                          height:  1.8,
                                          color:  Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 15,
                                  child: DropdownButton(

                                    hint: Text('Please choose a location',
                                      style:  TextStyle(
                                        fontSize:  23,
                                      ),
                                    ), // Not necessary for Option 1
                                    value: _selectedLocationTo,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedLocationTo = newValue;
                                      });
                                    },
                                    items: _locations.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),


                              ],
                            ),
                          ),

                          Container(
                            margin:  EdgeInsets.fromLTRB(1, 0, 0, 35),
                            width:  350,
                            height:  80,
                            child:
                            Stack(
                              children:  [


                                Positioned(
                                  // group11m79 (136:95)
                                  left:  0,
                                  top:  0,
                                  child:
                                  Align(
                                    child:
                                    SizedBox(
                                      width:  0,
                                      height:  0,
                                      // child:
                                      // Image.network(
                                      //   [Image url]
                                      //   width:  336,
                                      //   height:  57,
                                      // ),
                                    ),
                                  ),
                                ),


                                Positioned(
                                  // date5Nj (136:119)
                                  left:  0,
                                  top:  0,
                                  child:
                                  Align(
                                    child:
                                    SizedBox(
                                      width:  0,
                                      height:  0,
                                      child:
                                      Text(
                                        'DATE',
                                        textAlign:  TextAlign.center,
                                        style:  TextStyle(
                                          fontSize:  20,
                                          fontWeight:  FontWeight.w500,
                                          height:  1.38,
                                          color:  Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top:1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text("${selectedDate.toLocal()}".split(' ')[0],
                                        style:  TextStyle(
                                        fontSize:  19,
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      ElevatedButton(
                                        onPressed: () => _selectDate(context),
                                        child: const Text(
                                          'Select date',
                                          style: TextStyle(
                                          fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(

                            margin:  EdgeInsets.fromLTRB(10, 0, 52, 96),
                            width:  double.infinity,
                            height:  50,
                            child:
                            Row(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(

                                  // margin:  EdgeInsets.fromLTRB(0, 1, 26, 0),
                                  //padding:  EdgeInsets.only(left: 10,right: 10),
                                  // height:  double.infinity,
                                  // decoration:  BoxDecoration (
                                  //   color:  Colors.grey.shade300,
                                  //   borderRadius:  BorderRadius.circular(50),
                                  // ),
                                  child:
                                  Column(
                                    children: [
                                      Row(

                                        crossAxisAlignment:  CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:  [
                                          // Container(

                                          //   margin:  EdgeInsets.fromLTRB(0, 0, 43, 0),
                                          //   child:
                                          //   Text(
                                          //     'Class',
                                          //     textAlign:  TextAlign.center,
                                          //     style:  TextStyle(
                                          //       fontSize:  20,
                                          //       fontWeight:  FontWeight.w500,
                                          //       height:  1.38,
                                          //       color:  Colors.black,
                                          //     ),
                                          //   ),
                                          // ),


                                          Container(
                                            decoration:  BoxDecoration (
                                              color:  Colors.grey.shade300,
                                              borderRadius:  BorderRadius.circular(50),
                                            ),
                                            child: DropdownButton(
                                              hint: Text('Class',
                                                style:  TextStyle(
                                                  fontSize:  20,
                                                  fontWeight: FontWeight.w500,
                                                  height:  2,
                                                ),
                                              ), // Not necessary for Option 1
                                              value: _selectedclass,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedclass = newValue;
                                                });
                                              },
                                              items: _class.map((location) {
                                                return DropdownMenuItem(
                                                  child: new Text(location),
                                                  value: location,
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                          SizedBox(width:35),
                                          Container(

                                            // margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            // padding:  EdgeInsets.fromLTRB(14, 10, 0, 0.2),
                                            height:  40,

                                            decoration:  BoxDecoration (
                                              color:  Colors.grey.shade300,
                                              borderRadius:  BorderRadius.circular(30),
                                            ),
                                            child:
                                            Row(
                                              crossAxisAlignment:  CrossAxisAlignment.center,
                                              children:  [
                                                DropdownButton(
                                                  hint: Text('Passenger',
                                                    style:  TextStyle(
                                                      fontSize:  20,
                                                      fontWeight: FontWeight.w500,
                                                      height:  1.5,
                                                    ),
                                                  ), // Not necessary for Option 1
                                                  value: _selectedpassengers,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _selectedpassengers = newValue;
                                                    });
                                                  },
                                                  items: _passengers.map((location) {
                                                    return DropdownMenuItem(
                                                      child: new Text(location),
                                                      value: location,
                                                    );
                                                  }).toList(),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                      SizedBox(height:10,),
                                      ElevatedButton(

                                        onPressed: () {
                                          print("Button is clicked");
                                          saveData();
                                        },
                                        child: const Text(
                                          '  Book Now  ',
                                          style: TextStyle(
                                              fontSize: 25,
                                              // backgroundColor: Colors.indigo,
                                              color:Colors.white
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            Positioned(
              left:  13,
              top:  67,
              child:
              Align(
                child:
                SizedBox(
                  width:  174,
                  height:  111,
                  child:
                  Text(
                    'Book your \nFlight',
                    textAlign:  TextAlign.start,
                    style:  TextStyle(
                      fontSize:  25,
                      fontWeight:  FontWeight.w800,
                      height:  1.38,
                      color:  Colors.white,
                    ),
                  ),
                ),
              ),
            ),



            // Positioned(
            //   left:  16,
            //   top:  15,
            //   child:
            //   Align(
            //     child:
            //     SizedBox(
            //       width:  19,
            //       height:  4,
            //       // child:
            //       // TextButton(
            //       //   onPressed:  () {},
            //       //   style:  TextButton.styleFrom (
            //       //     padding:  EdgeInsets.zero,
            //       //   ),
            //         child:
            //         Text(
            //           '🡠',
            //           textAlign:  TextAlign.center,
            //           style:  TextStyle(
            //             fontSize:  23,
            //             fontWeight:  FontWeight.w500,
            //             height:  1.38,
            //             color:  Colors.black,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),


            Positioned(
              left:  19,
              top:  206,
              child:
              Align(
                child:
                SizedBox(
                  width:  181,
                  height:  83,
                  child:
                  Text(
                    'Where are you flying to?',
                    textAlign:  TextAlign.start,
                    style:  TextStyle(
                      fontSize:  21,
                      fontWeight:  FontWeight.w700,
                      height:  1.38,
                      color:  Colors.white,
                    ),
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
