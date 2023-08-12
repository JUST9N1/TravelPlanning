// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// class Wishlist extends StatefulWidget {
//   const Wishlist({Key? key}) : super(key: key);
//
//   @override
//   _WishlistState createState() => _WishlistState();
// }
//
// class _WishlistState extends State<Wishlist> {
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   String imagePath = 'img/heritage/patan-durbar.jpg'; // Replace with the actual path to your image
//   String imageUrl = ''; // Declare a variable to store the image URL
//
//   @override
//   void initState() {
//     super.initState();
//     retrieveImage();
//   }
//
//   void retrieveImage() async {
//     Reference ref = storage.ref().child(imagePath);
//     String downloadURL = await ref.getDownloadURL();
//     setState(() {
//       imageUrl = downloadURL;
//     });
//   }
//
//   int _currentIndex = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.black,
//         showUnselectedLabels: false,
//         showSelectedLabels: false,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users"),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 20, right: 10, top: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Favorites",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 Icon(Icons.notifications),
//               ],
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               if (imageUrl.isNotEmpty) // Only display the image if the URL is not empty
//                 Container(
//                   margin: EdgeInsets.only(left: 20, right: 15,), // Set the desired margin
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20), // Set the border radius to make the corners circular
//                     child: Image.network(
//                       imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  String imagePath = 'img/heritage/patan-durbar.jpg'; // Replace with the actual path to your image
  String imageUrl = ''; // Declare a variable to store the image URL

  @override
  void initState() {
    super.initState();
    retrieveImage();
  }

  void retrieveImage() async {
    Reference ref = storage.ref().child(imagePath);
    String downloadURL = await ref.getDownloadURL();
    setState(() {
      imageUrl = downloadURL;
    });
  }

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
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
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Users"),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Favorites",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.notifications),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (imageUrl.isNotEmpty) // Only display the image if the URL is not empty
                GestureDetector(
                  onTap: () {
                    // Define the action to perform when the image is tapped
                    Navigator.of(context).pushNamed("/detail"); // R)
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Set the desired margin
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Set the border radius to make the corners circular
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}


