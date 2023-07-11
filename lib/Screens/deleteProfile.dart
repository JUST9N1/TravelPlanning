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

