import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_background/animated_background.dart';
import 'package:gerakin_bach3/pages/kamus.dart';
import 'package:gerakin_bach3/pages/speech.dart';
import 'package:gerakin_bach3/pages/profile_screen.dart';
import 'package:gerakin_bach3/pages/data.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    FirstScreen(), // Assuming HomeScreen is your initial screen
    SpeechScreen(),
    SignLanguageDictionaryPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _selectedIndex == 0
          ? Stack(
              children: [
                // Animated Background
                AnimatedBackground(
                  behaviour: RandomParticleBehaviour(
                    options: const ParticleOptions(
                      spawnMaxRadius: 10,
                      spawnMinSpeed: 15,
                      particleCount: 80,
                      spawnMaxSpeed: 50,
                      spawnOpacity: 0.2,
                      baseColor: Colors.blue,
                    ),
                  ),
                  vsync: this,
                  child: Container(),
                ),
                // Main Content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CarouselSlider
                      CarouselSlider(
                        items: [
                          Image.asset("assets/gerakinsatu.png"),
                          Image.asset("assets/gerakindua.png"),
                          Image.asset('assets/gerakintiga.png'),
                        ],
                        options: CarouselOptions(
                          height: 200,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {},
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Texts and Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                              'SELAMAT DATANG',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(137, 244, 232, 232),
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    blurRadius: 2,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Hidup ini penuh warna, walaupun tak dapat didengar, tetapi dunia tetap indah untuk dijelajahi.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(166, 25, 25, 25),
                              ),
                            ),
                            SizedBox(height: 30),
                            // Buttons
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyDataPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: Size(w, 50),
                              ),
                              child: Text(
                                'Start Detecting',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpeechScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                minimumSize: Size(w, 50),
                              ),
                              child: Text(
                                'Speech to Text',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : _widgetOptions.elementAt(_selectedIndex),
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
            icon: Icon(Icons.book),
            label: 'Kamus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
