import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login.dart';

class KesanPage extends StatefulWidget {
  const KesanPage({Key? key}) : super(key: key);

  @override
  State<KesanPage> createState() => _KesanPage();
}

class _KesanPage extends State<KesanPage> {
  List<String> kesan = [
    '1. Kesan',
    'Mata kuliah Pemrograman Mobile memberikan pengalaman yang menarik dan sangat relevan dalam mengembangkan aplikasi mobile.',
    'Melalui mata kuliah ini, saya dapat belajar tentang konsep dan teknik pengembangan aplikasi mobile menggunakan platform seperti Android.',
    '2. Pesan',
    'Semangat... semoga sukses semuanya.. amiin...',
    'Bismillah nilai A',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.grey[800],
        title: Text("Kesan dan Pesan"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF64B5F6), // Warna gradient pertama
              Color(0xFFE0F7FA), // Warna gradient kedua
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: kesan.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      kesan[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  await prefs.setBool('is_logged_in', false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'L O G O U T',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
