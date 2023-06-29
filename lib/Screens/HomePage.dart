import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:travelplanning/Screens/DetailPage.dart';
import 'package:travelplanning/Screens/navpages/search_page.dart';
import 'package:travelplanning/widgets/app_large_text.dart';
import 'package:travelplanning/widgets/app_text.dart';
import 'package:travelplanning/widgets/firebaseImages.dart';

import '../misc/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // menu text
        Container(
          padding: const EdgeInsets.only(top: 65, left: 20),
          child: Row(
            children: [
              Container(child: AppLargeText(text: "Greetings!!")),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ));
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 25),
          child: AppText(text: "Sujan Gautam"),
        ),
        const SizedBox(
          height: 25,
        ),

        // discover text
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: AppLargeText(text: "Discover"),
        ),
        const SizedBox(
          height: 20,
        ),

        // tabbar
        Container(
            child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              controller: tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:
                  CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: const [
                Tab(text: "Heritage"),
                Tab(text: "Mountains"),
                Tab(text: "Lake"),
                Tab(text: "Waterfall"),
              ]),
        )),
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 300,
          width: double.maxFinite,
          child: TabBarView(
            controller: tabController,
            children: [
              // Heritage Part
              GestureDetector(
                onTap: () {
                   Navigator.pushAndRemoveUntil(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => const DetailPage()),
                            (route) => false);
                },
                child: ListView.builder(
                  itemCount: heritageImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final imageName = heritageImages.keys.elementAt(index);
                    final imageUrl =
                        'gs://travelplanning-64738.appspot.com/heritage/$imageName';
              
                    return FutureBuilder(
                      future: firebase_storage.FirebaseStorage.instance
                          .refFromURL(imageUrl)
                          .getDownloadURL(),
                      builder:
                          (BuildContext context, AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(snapshot.data!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text('Error loading image'),
                            ),
                          );
                        } else {
                          return Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),

// Mountain Part
              ListView.builder(
                itemCount: mountainImages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final imageName2 = mountainImages.keys.elementAt(index);
                  var imageUrl =
                      'gs://travelplanning-64738.appspot.com/mountains/$imageName2';

                  return FutureBuilder(
                    future: firebase_storage.FirebaseStorage.instance
                        .refFromURL(imageUrl)
                        .getDownloadURL(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text('Error loading image'),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  );
                },
              ),

// Lake Part
              ListView.builder(
                itemCount: lakeImages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final imageName = lakeImages.keys.elementAt(index);
                  final imageUrl =
                      'gs://travelplanning-64738.appspot.com/lake/$imageName';

                  return FutureBuilder(
                    future: firebase_storage.FirebaseStorage.instance
                        .refFromURL(imageUrl)
                        .getDownloadURL(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text('Error loading image'),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  );
                },
              ),

// Waterfall Part
              ListView.builder(
                itemCount: waterfallImages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final imageName = waterfallImages.keys.elementAt(index);
                  final imageUrl =
                      'gs://travelplanning-64738.appspot.com/waterfall/$imageName';

                  return FutureBuilder(
                    future: firebase_storage.FirebaseStorage.instance
                        .refFromURL(imageUrl)
                        .getDownloadURL(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text('Error loading image'),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Top Destination",
                  size: 22,
                ),
                AppText(text: "See all", color: AppColors.texColor1)
              ],
            )),

        const SizedBox(
          height: 10,
        ),
        //modified code:

        Container(
          height: 120,
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 20),
          child: ListView.builder(
            itemCount: topDestinationImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final imageName = topDestinationImages.keys.elementAt(index);
              final imageUrl =
                  'gs://travelplanning-64738.appspot.com/topDestination/$imageName';

              return FutureBuilder<String>(
                future: firebase_storage.FirebaseStorage.instance
                    .refFromURL(imageUrl)
                    .getDownloadURL(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Display a placeholder or loading indicator while fetching the URL
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    // Handle the error if URL retrieval fails
                    return Text('Error retrieving image URL');
                  }
                  if (snapshot.hasData) {
                    String httpsUrl = snapshot.data!;
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(httpsUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            child: AppText(
                              text:
                                  topDestinationImages.values.elementAt(index),
                              color: AppColors.textColor2,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  // Handle other snapshot states if necessary
                  return Container();
                },
              );
            },
          ),
        )
      ],
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}