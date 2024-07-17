import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gerakin_bach3/pages/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gerakin_bach3/pages/deteksi.dart';
import 'package:gerakin_bach3/pages/home_screen.dart';
import 'package:gerakin_bach3/pages/speech.dart';

class MyDataPage extends StatefulWidget {
  @override
  _MyDataPageState createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  String? _selectedGender;
  String? _selectedAgeGroup;

  void _submitData() async {
    if (_selectedGender == null || _selectedAgeGroup == null) {
      Fluttertoast.showToast(msg: "Please select both gender and age group");
      return;
    }

    final response = await http.post(
      Uri.parse('http://194.31.53.102:21049/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'gender': _selectedGender!,
        'age_group': _selectedAgeGroup!,
      }),
    );

    if (response.statusCode == 201) {
      Fluttertoast.showToast(msg: "Data added successfully");
    } else {
      Fluttertoast.showToast(msg: "Failed to add data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masukkan Data Anda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                'assets/gerakinsatu.png', // Path to your logo asset
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Masukkan data Anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: "Pilih Jenis Kelamin",
                labelText: "Jenis Kelamin",
                border: OutlineInputBorder(),
              ),
              value: _selectedGender,
              items: ['Laki-Laki', 'Perempuan'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: "Pilih Grup Usia",
                labelText: "Grup Usia",
                border: OutlineInputBorder(),
              ),
              value: _selectedAgeGroup,
              items: ['Muda', 'Tua', 'Anak-anak'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedAgeGroup = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraScreen()),
                );
              },
              child: Text(
                'Start Detection',
                style: TextStyle(fontSize: 18.0),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Speech',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Current index for MyDataPage
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FirstScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpeechScreen()),
              );
              break;
            case 3:
              // Handle Profile navigation if needed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}
