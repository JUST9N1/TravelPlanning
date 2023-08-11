import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelplanning/screens/signIn.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 20, top: 30),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 180, top: 0),
            child: const Text(
              "Settings",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          _buildSettingItem(
            context,
            text: "Country",
            onTap: () {},
          ),
          const SizedBox(height: 30),
          _buildSettingItem(
            context,
            text: "Customer Support",
            onTap: () {},
          ),
          const SizedBox(height: 30),
          _buildSettingItem(
            context,
            text: "Privacy Policy",
            onTap: () {},
          ),
          const SizedBox(height: 30),
          _buildSettingItem(
            context,
            text: "Give us Feedback",
            onTap: () {
              Navigator.of(context).pushNamed("/feedback");
            },
          ),
          const SizedBox(height: 30),
          _buildSettingItem(
            context,
            text: "About us",
            onTap: () {},
          ),
          const SizedBox(height: 30),
          _buildSettingItem(
            context,
            text: "Logout",
            onTap: () => _showLogoutConfirmationDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, {required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 20),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => _logout(context),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      print('Error logging out: $e');
      // Handle any error that occurs during logout
    }
  }
}
