import 'package:flutter/material.dart';

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  Widget titleSection(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.lightGreen.shade700,
            size: 25,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget sidebarItem(
    IconData icon,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 5),
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget skillItem(String text) {
    return Container(
      margin: const EdgeInsets.only(
        right: 8,
        bottom: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.lightGreen.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.lightGreen.shade800,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('CV Bilqis Aura Maharani'),
        backgroundColor: Colors.lightGreen.shade700,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // SIDEBAR KIRI
              // =========================
              Container(
                width: 145,
                constraints: const BoxConstraints(
                  minHeight: 850,
                ),
                padding: const EdgeInsets.fromLTRB(
                  15,
                  30,
                  15,
                  30,
                ),
                decoration: BoxDecoration(
                  color: Colors.lightGreen.shade700,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    // FOTO
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://i.ibb.co.com/vbn4RLS/Whats-App-Image-2026-07-28-at-08-32-22.jpg',
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // NAMA
                    const Text(
                      "Bilqis Aura Maharani",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "PPLG Student",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // KONTAK
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "KONTAK",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    sidebarItem(
                      Icons.phone,
                      "083102761262",
                    ),

                    sidebarItem(
                      Icons.email,
                      "bilqisauramaharani@gmail.com",
                    ),

                    sidebarItem(
                      Icons.location_on,
                      "Desa Patuanan, Blok Minggu, "
                      "Kec. Leuwimunding, "
                      "Kab. Majalengka",
                    ),

                    const SizedBox(height: 15),

                    // HOBI
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "HOBI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    sidebarItem(
                      Icons.edit,
                      "Menulis",
                    ),

                    sidebarItem(
                      Icons.music_note,
                      "Mendengarkan Musik",
                    ),
                  ],
                ),
              ),

              // =========================
              // ISI UTAMA
              // =========================
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TENTANG SAYA
                      titleSection(
                        "Tentang Saya",
                        Icons.person,
                      ),

                      const Text(
                        "Nama saya Bilqis Aura Maharani. "
                        "Saya lahir di Majalengka pada 5 Juli 2008 "
                        "dan tinggal di Desa Patuanan, Blok Minggu, "
                        "Kecamatan Leuwimunding, Kabupaten Majalengka. "
                        "Saya bersekolah di SMKN 1 Leuwimunding "
                        "dan mengambil jurusan Pengembangan Perangkat "
                        "Lunak dan Gim (PPLG).",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 35),

                      // PENDIDIKAN
                      titleSection(
                        "Pendidikan",
                        Icons.school,
                      ),

                      Container(
                        padding: const EdgeInsets.only(
                          left: 18,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.lightGreen.shade500,
                              width: 4,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "SMKN 1 Leuwimunding",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Jurusan Pengembangan Perangkat "
                              "Lunak dan Gim (PPLG)",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              "2024 - Sekarang",
                              style: TextStyle(
                                color: Colors.lightGreen.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // KEAHLIAN
                      titleSection(
                        "Keahlian",
                        Icons.computer,
                      ),

                      Wrap(
                        children: [
                          skillItem("Flutter"),
                          skillItem("Dart"),
                          skillItem("HTML"),
                          skillItem("CSS"),
                          skillItem("JavaScript"),
                          skillItem("MySQL"),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // PENGALAMAN
                      titleSection(
                        "Pengalaman",
                        Icons.work,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.local_florist,
                            color: Colors.lightGreen.shade600,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "Pernah membuat buket bunga",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.cake,
                            color: Colors.lightGreen.shade600,
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              "Pernah membuat kue",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Container(
                        width: double.infinity,
                        height: 3,
                        color: Colors.lightGreen.shade300,
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen.shade700,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                          label: const Text(
                            'Kembali ke Portofolio',
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}