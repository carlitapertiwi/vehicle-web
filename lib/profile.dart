import 'package:flutter/material.dart';

import 'cv_bilqis.dart';
import 'cv_carlita.dart';
import 'cv_lia.dart';
import 'cv_sopyan.dart';
import 'cv_yoga.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Anggota'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Profil Developer',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF123B69),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Pilih anggota untuk melihat CV.',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 22),

          anggotaCard(
            context,
            nama: 'Bilqis Aura Maharani',
            subtitle: 'PPLG Student',
            icon: Icons.person,
            halaman: const CVPage(),
          ),

          anggotaCard(
            context,
            nama: 'Carlita Wan Pertiwi',
            subtitle: 'Mobile App Developer',
            icon: Icons.person,
            halaman: const CarlitaCvPage(),
          ),

          anggotaCard(
            context,
            nama: 'Lia',
            subtitle: 'PPLG Student',
            icon: Icons.person,
            halaman: const LiaCvPage(),
          ),

          anggotaCard(
            context,
            nama: 'Muhammad Sopyan',
            subtitle: 'Flutter Developer & Striker',
            icon: Icons.person,
            halaman: const SopyanCvPage(),
          ),

          anggotaCard(
            context,
            nama: 'Yoga Hazimulfikri',
            subtitle: 'Flutter Developer & Mobile Enthusiast',
            icon: Icons.person,
            halaman: const YogaCvPage(),
          ),
        ],
      ),
    );
  }

  Widget anggotaCard(
    BuildContext context, {
    required String nama,
    required String subtitle,
    required IconData icon,
    required Widget halaman,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        leading: CircleAvatar(
          radius: 27,
          backgroundColor: const Color(0xFFE3F2FD),
          child: Icon(
            icon,
            color: const Color(0xFF1565C0),
          ),
        ),

        title: Text(
          nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.grey,
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => halaman,
            ),
          );
        },
      ),
    );
  }
}