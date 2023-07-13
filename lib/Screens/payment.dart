import 'package:flutter/material.dart';




class Payment extends StatefulWidget {

  const Payment({Key? key}) : super(key: key);

  @override

  _PaymentState createState() => _PaymentState();

}

class _PaymentState extends State<Payment> {

  int selectedPaymentOption = 0; // Track the selected payment option

  bool paymentSuccessful = false; // Track payment success




  @override

  Widget build(BuildContext context) {

    return Scaffold(

        body: Container(

        width: double.infinity,

        color: Colors.white,

        child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

        Container(

        padding: const EdgeInsets.fromLTRB(14, 21, 14, 118),

    width: double.infinity,

    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

    Container(

    padding: const EdgeInsets.only(left: 110, top: 50),

    margin: const EdgeInsets.only(bottom: 94),

    child: const Text(

    'Payment',

    textAlign: TextAlign.right,

    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),

    ),

    ),


      const SizedBox(height: 10), // Add some vertical spacing

      const Text('Choose any payment option'),

      const SizedBox(height: 10), // Add some vertical spacing

      buildPaymentOption('img/esewa.png', 0),

      const SizedBox(height: 10), // Add some vertical spacing

      buildPaymentOption('img/fonepay.png', 1),

      buildTotal(),

      buildConfirmPaymentButton(),

      const SizedBox(height: 10),

      buildCancelPaymentButton(),

      if (paymentSuccessful) const Text('Payment Successful'),

                  ],

               ),

            ),

          ],

         ),

        ),

    );

  }
