import 'package:flutter/material.dart';

// ============================================================
// CV YOGA HAZIMULFIKRI
// ============================================================

class YogaCvPage extends StatelessWidget {
  const YogaCvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('CV Yoga Hazimulfikri'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ==================================================
            // FOTO PROFIL
            // ==================================================
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent, width: 3),
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://i.ibb.co.com/21nMvcjG/IMG-20260811-WA0006.jpg',
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ==================================================
            // NAMA
            // ==================================================
            const Text(
              'Yoga Hazimulfikri',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            const Text(
              'Flutter Developer & Mobile Enthusiast',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 18),

            // ==================================================
            // KONTAK
            // ==================================================
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.email, size: 20, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Expanded(child: Text('naonwelah@gmail.com')),
                      ],
                    ),

                    Divider(height: 24),

                    Row(
                      children: [
                        Icon(Icons.phone, size: 20, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Expanded(child: Text('+62 843-8473-0294')),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ==================================================
            // TENTANG SAYA
            // ==================================================
            const YogaSectionTitle(title: 'Tentang Saya', icon: Icons.person),

            const SizedBox(height: 8),

            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Seorang pengusaha peternakan yang sukses di bidang itu '
                  'dan juga menyukai pekerjaannya.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 22),

            // ==================================================
            // PENGALAMAN KERJA
            // ==================================================
            const YogaSectionTitle(title: 'Pengalaman Kerja', icon: Icons.work),

            const SizedBox(height: 8),

            const YogaExperienceCard(
              role: 'Flutter Developer',
              company: 'PT Peternakan Galaxy',
              period: '2009 - Sekarang',
              description: 'Mengembangkan dan memelihara hewan ternak.',
            ),

            const YogaExperienceCard(
              role: 'Junior Mobile Programmer',
              company: 'Tam Tama',
              period: '2015 - 2026',
              description: 'Membuat peternakan terbesar se-Asia.',
            ),

            const SizedBox(height: 22),

            // ==================================================
            // PENDIDIKAN
            // ==================================================
            const YogaSectionTitle(title: 'Pendidikan', icon: Icons.school),

            const SizedBox(height: 8),

            const YogaEducationCard(
              institution: 'Universitas Pengembang Biakan Hewan',
              degree: 'PPLG (Pengusaha Peternakan Luas dan Gacor)',
              period: '2009 - 2026',
            ),

            const SizedBox(height: 22),

            // ==================================================
            // KEAHLIAN
            // ==================================================
            const YogaSectionTitle(title: 'Keahlian', icon: Icons.star),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: const [
                YogaSkillChip(label: 'MAKAN'),
                YogaSkillChip(label: 'MINUM'),
                YogaSkillChip(label: 'NAFAS'),
                YogaSkillChip(label: 'HIKKING'),
                YogaSkillChip(label: 'RUNNING'),
                YogaSkillChip(label: 'MAEN BALL'),
              ],
            ),

            const SizedBox(height: 30),

            // ==================================================
            // TOMBOL KEMBALI
            // ==================================================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Portofolio'),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// JUDUL SECTION
// ============================================================

class YogaSectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const YogaSectionTitle({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.blueAccent, size: 22),
          ),

          const SizedBox(width: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CARD PENGALAMAN
// ============================================================

class YogaExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final String description;

  const YogaExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),

      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              role,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 4),

            Text(
              company,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 3),

            Row(
              children: [
                const Icon(Icons.calendar_month, size: 14, color: Colors.grey),

                const SizedBox(width: 5),

                Text(
                  period,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: const TextStyle(fontSize: 13, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// CARD PENDIDIKAN
// ============================================================

class YogaEducationCard extends StatelessWidget {
  final String institution;
  final String degree;
  final String period;

  const YogaEducationCard({
    super.key,
    required this.institution,
    required this.degree,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,

      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),

              child: const Icon(Icons.school, color: Colors.blueAccent),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    degree,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    institution,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    period,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// CHIP KEAHLIAN
// ============================================================

class YogaSkillChip extends StatelessWidget {
  final String label;

  const YogaSkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.check_circle,
        color: Colors.blueAccent,
        size: 18,
      ),

      backgroundColor: Colors.blueAccent.withOpacity(0.08),

      side: BorderSide(color: Colors.blueAccent.withOpacity(0.25)),

      label: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}