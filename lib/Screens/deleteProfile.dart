import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:travelplanning/Screens/signIn.dart';




class DeleteAccount extends StatelessWidget {

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();




  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Stack(

          children: [

            Container(

              decoration: BoxDecoration(

                image: DecorationImage(

                  image: AssetImage("img/bookingImage.png"),

                  fit: BoxFit.cover,

                ),

              ),

            ),
            Padding(

              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(

                    height: 100,

                    width: 100,

                    child: SvgPicture.asset("img/patan-durbar.jpg"),

                  ),

                  SizedBox(height: 10),

                  Text(

                    "Delete Account",

                    style: TextStyle(color: Colors.white, fontSize: 20),

                  ),

                  SizedBox(height: 20),

                  Padding(

                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),

                    child: TextField(

                      controller: email,

                      decoration: InputDecoration(

                        hintText: 'Email',

                        hintStyle: TextStyle(color: Colors.white),

                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10.0),

                          borderSide: BorderSide(color: Colors.white),

                        ),

                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10.0),

                          borderSide: BorderSide(color: Colors.blue),

                        ),

                        isDense: true,

                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),

                      ),

                      cursorColor: Colors.white,

                      style: TextStyle(color: Colors.white),

                    ),

                  ),

                  SizedBox(height: 20),

                  Padding(

                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),

                    child: TextField(

                      controller: pass,

                      decoration: InputDecoration(

                        hintText: 'Password',

                        hintStyle: TextStyle(color: Colors.white),

                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10.0),

                          borderSide: BorderSide(color: Colors.white),

                        ),

                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10.0),

                          borderSide: BorderSide(color: Colors.blue),

                        ),

                        isDense: true,

                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),

                      ),

                      cursorColor: Colors.white,

                      style: TextStyle(color: Colors.white),

                    ),

                  ),

                  SizedBox(height: 20),

                  GestureDetector(

                    onTap: () {

                      print("Delete Account Clicked Event");

                      _deleteAccount(context, email.text, pass.text);

                      // Navigator.pushReplacement(

                      //   context,

                      //   MaterialPageRoute(

                      //       builder: (context) => const LoginPage()),

                      // );

                    },

                    child: Text(

                      "Delete Account",

                      style: TextStyle(color: Colors.white),

                    ),

                  ),

                ],

              ),

            )

          ],

        ),

      ),

    );

  }



