import 'package:flutter/material.dart';

class LiaCvPage extends StatelessWidget {
  const LiaCvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV Lia'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.lightBlue,
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),

            const SizedBox(height: 15),

            const Text(
              'Lia',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const Text('PPLG Student', style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 30),

            const Card(
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.lightBlue),
                title: Text('Tentang Saya'),
                subtitle: Text(
                  'Siswi PPLG yang tertarik dengan '
                  'pengembangan aplikasi dan teknologi.',
                ),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.lightBlue),
                title: Text('Pendidikan'),
                subtitle: Text('SMKN 1 Leuwimunding - PPLG'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.code, color: Colors.lightBlue),
                title: Text('Keahlian'),
                subtitle: Text('Flutter, Dart, HTML, CSS, MySQL'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.work, color: Colors.lightBlue),
                title: Text('Pengalaman'),
                subtitle: Text('Membuat project aplikasi Flutter.'),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Portofolio'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}