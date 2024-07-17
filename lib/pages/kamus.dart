import 'package:flutter/material.dart';

class SignLanguageDictionaryPage extends StatelessWidget {
  final List<Map<String, String>> signs = [
    {"image": "assets/bahagia.png", "text": "Bahagia"},
    {"image": "assets/gembira.png", "text": "Gembira"},
    {"image": "assets/sedih.png", "text": "Sedih"},
    {"image": "assets/kecewa.png", "text": "Kecewa"},
    {"image": "assets/takut.png", "text": "Takut"},
    {"image": "assets/senang.png", "text": "Senang"},
    {"image": "assets/marah.png", "text": "Marah"},
    {"image": "assets/bingung.png", "text": "Bingung"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language Dictionary'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        itemCount: signs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showSignDetail(context, signs[index]),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        signs[index]["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      signs[index]["text"]!,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSignDetail(BuildContext context, Map<String, String> sign) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(sign["text"]!),
        content: Image.asset(sign["image"]!),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
