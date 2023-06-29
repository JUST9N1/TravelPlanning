
import 'package:flutter/material.dart';
import 'package:travelplanning/Screens/signIn.dart';

import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/" + images[index]

                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(text: "Trips"),
                AppText(text: "Holidays!!!", size: 30,),
                SizedBox(height: 20,),
                Container(
                  width: 250,
                  child: AppText(
                    text: "All your vacations destinations are here,\nenjoy your holiday",
                    color: AppColors.mainColor,
                    size: 14,
                  ),
                ),
                SizedBox(height: 40,),

                GestureDetector(
                  child: Container(
                    width: 150,
                      child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 8.0,
                        ),
                      ),
                      child: const Text("Get Started"))))),
                Column(
                  children: List.generate(2, (indexDots){
                    return Container(
                      margin: const EdgeInsets.only(bottom:2),
                      width: 8,
                      height: index==indexDots?25:8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:index==indexDots? AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                      ),
                    );
              }),
                )
            ],

                )
              ]
            )));
        }),
    );
  }
}