import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lakePage extends StatefulWidget {
  const lakePage({Key? key}) : super(key: key);

  @override
  State<lakePage> createState() => _lakePageState();
}

class _lakePageState extends State<lakePage> with TickerProviderStateMixin {
  bool showSearchBar = false;

  // var images={
  //   "ll.png":"Shey Phoksundo /n Nepal,SouthEast Asia",
  //   "gokyo.png":"Gokyo /n Solukhumbu,Nepal",
  //   "tili.jpg":"Tilicho /n Manag, Nepal",
  //   "rara.jpg":"Rara Lake /n Mugu,Nepal",
  //   "gosaikunda.jpg":"Gosaikunda /n Rasuwa,Nepal",
  //   "star.png":"star",
  // };
  int idx = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            // currentIndex: idx,
            // onTap: (val){
            //   setState(() {
            //     idx=val;
            //   });

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users"),
            ]),
        //ICONS
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Discover",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  showSearchBar = true; // Show the search bar
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {
                // Add your desired functionality here
              },
            ),
          ],
        ),
        body: Column(
          children: [
            //TAB BAR
            Container(
              child: Align(
                // alignment: Alignment.centerLeft,
                child: TabBar(
                  // labelPadding: const EdgeInsets.only(left: 0, right: 0),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  // isScrollable: true,
                  tabs: [
                    Tab(text: "Mountain"),
                    Tab(text: "Waterfalls"),
                    Tab(text: "Lake"),
                    Tab(text: "Heritages"),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                  'Assets/images/asd.png',
                                ),
                                fit: BoxFit.cover)),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 15,
                              right: 5,
                              child: Image.asset(
                                'Assets/images/star.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                left: 10,
                                child: Container(
                                  width: 180,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                )),
                            Positioned(
                              bottom: 33,
                              left: 40,
                              child: InkWell(
                                  onTap: () {
                                    // Navigator.of(context).pop();
                                    // Add your onTap logic here
                                  },
                                  child: Text(
                                    "Machhapuchhare",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 40,
                              child: Text(
                                'Nepal, South Asia',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Text("there"),
                  Text("he"),
                  Text("hh")
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Destination",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade300,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'Assets/images/nagarkot.png',
                                    width: 100,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 30,
                                right: 15,
                                child: InkWell(
                                    onTap: () {
                                      // Navigator.of(context).pop();
                                      // Add your onTap logic here
                                    },
                                    child: Text(
                                      "Nagarkot",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                              ),
                              Positioned(
                                top: 50,
                                right: 5,
                                child: Text(
                                  'Bhaktapur, Nepal',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}
