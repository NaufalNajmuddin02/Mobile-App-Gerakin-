import 'package:flutter/material.dart';
import 'change_password_screen.dart'; // Import the change password screen
import 'update_email_screen.dart'; // Import screen for updating email
import 'update_profile_picture_screen.dart'; // Import screen for updating profile picture

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue.shade100],
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Manage your account settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 104, 104, 104),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            _buildSettingsButton(
              context,
              'Change Password',
              Icons.lock,
              UpdatePasswordPage(),
            ),
            SizedBox(height: 20),
            _buildSettingsButton(
              context,
              'Change Email',
              Icons.email,
              UpdateEmailScreen(),
            ),
            SizedBox(height: 20),
            _buildSettingsButton(
              context,
              'Change Profile Picture',
              Icons.person,
              EditProfilePage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsButton(
      BuildContext context, String title, IconData icon, Widget screen) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      icon: Icon(
        icon,
        color: Colors.blue,
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(color: Colors.blue),
      ),
    );
  }
}
