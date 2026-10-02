import 'package:flutter/material.dart';
import 'kendaraan.dart';
import 'profile.dart';
import 'login.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // BACKGROUND GRADIENT
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD9F1FF),
              Color(0xFFAEDCFF),
              Color(0xFF4A91D3),
              Color(0xFF092D59),
            ],
            stops: [0.0, 0.28, 0.65, 1.0],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 15,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ================= HEADER =================

                Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.80),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/images/logo.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(width: 13),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VehicleHub',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF082849),
                          ),
                        ),
                        Text(
                          'Pendataan Kendaraan',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF416889),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: Color(0xFF123B67),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // ================= WELCOME =================

                const Text(
                  'Selamat Datang 👋',
                  style: TextStyle(
                    color: Color(0xFF123B67),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Dashboard VehicleHub',
                  style: TextStyle(
                    color: Color(0xFF06284D),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Kelola data kendaraan dengan lebih mudah.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3E6587),
                  ),
                ),

                const SizedBox(height: 30),

                // ================= MAIN CARD =================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(23),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF438FD1),
                        Color(0xFF174D84),
                        Color(0xFF082D58),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Row(
                        children: [
                          Icon(
                            Icons.directions_car_filled_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'VehicleHub',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'Sistem Pendataan Kendaraan',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.80),
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        children: [

                          // DATA KENDARAAN

                          Expanded(
                            child: _menuButton(
                              icon: Icons.directions_car_rounded,
                              title: 'Data\nKendaraan',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const KendaraanPage(),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(width: 13),

                          // PROFILE

                          Expanded(
                            child: _menuButton(
                              icon: Icons.groups_rounded,
                              title: 'Profil\nAnggota',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const ProfilePage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // ================= QUICK MENU =================

                const Text(
                  'Menu Utama',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B345F),
                  ),
                ),

                const SizedBox(height: 14),

                _listMenu(
                  context,
                  icon: Icons.list_alt_rounded,
                  title: 'Data Kendaraan',
                  subtitle: 'Tambah, edit dan hapus kendaraan',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const KendaraanPage(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 12),

                _listMenu(
                  context,
                  icon: Icons.person_outline_rounded,
                  title: 'Profil Developer',
                  subtitle: 'Lihat profil & CV anggota kelompok',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProfilePage(),
                      ),
                    );
                  },
                ),

                const Spacer(),

                Center(
                  child: Text(
                    'SMKN 1 Leuwimunding • VehicleHub',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.65),
                      fontSize: 11,
                    ),
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= CARD MENU ATAS =================

  static Widget _menuButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.13),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.20),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= LIST MENU =================

  static Widget _listMenu(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.72),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 7),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF66B7F1),
                    Color(0xFF145A97),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B345F),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF63819E),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
              color: Color(0xFF3976A8),
            ),
          ],
        ),
      ),
    );
  }
}