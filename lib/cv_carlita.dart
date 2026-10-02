import 'package:flutter/material.dart';

// ============================================================
// WARNA TEMA PASTEL
// ============================================================

const Color kPurple = Color(0xFF7758D6);
const Color kLightPurple = Color(0xFFE9E2FF);
const Color kPink = Color(0xFFFF91B9);
const Color kLightPink = Color(0xFFFFE4EE);
const Color kYellow = Color(0xFFFFD66B);
const Color kLightYellow = Color(0xFFFFF4CF);
const Color kBlue = Color(0xFF71B8FF);
const Color kLightBlue = Color(0xFFE3F2FF);
const Color kGreen = Color(0xFF62C9A5);
const Color kDark = Color(0xFF29263D);
const Color kGrey = Color(0xFF777386);
const Color kBackground = Color(0xFFFFFAF4);

// ============================================================
// HALAMAN CV CARLITA
// ============================================================

class CarlitaCvPage extends StatelessWidget {
  const CarlitaCvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,

      appBar: AppBar(
        title: const Text('CV Carlita Wan Pertiwi'),
        centerTitle: true,
        backgroundColor: kPurple,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              // =========================================
              // PROFIL
              // =========================================
              _CuteProfileSection(),

              SizedBox(height: 24),

              // =========================================
              // TENTANG SAYA
              // =========================================
              _AboutNote(),

              SizedBox(height: 24),

              // =========================================
              // KEAHLIAN
              // =========================================
              _SectionHeader(
                number: '01',
                title: 'Keahlian Utama',
                subtitle: 'Hal yang sedang saya pelajari',
                icon: Icons.auto_awesome_rounded,
              ),

              SizedBox(height: 13),

              _SkillsGrid(),

              SizedBox(height: 27),

              // =========================================
              // PENGALAMAN
              // =========================================
              _SectionHeader(
                number: '02',
                title: 'Pengalaman',
                subtitle: 'Pengalaman usaha yang saya miliki',
                icon: Icons.work_outline_rounded,
              ),

              SizedBox(height: 13),

              _ExperienceCard(),

              SizedBox(height: 27),

              // =========================================
              // PENDIDIKAN
              // =========================================
              _SectionHeader(
                number: '03',
                title: 'Pendidikan',
                subtitle: 'Perjalanan pendidikan saya',
                icon: Icons.school_outlined,
              ),

              SizedBox(height: 13),

              _EducationTimeline(),

              SizedBox(height: 27),

              // =========================================
              // FOOTER
              // =========================================
              _FooterQuote(),

              SizedBox(height: 25),
            ],
          ),
        ),
      ),

      // =========================================
      // TOMBOL KEMBALI
      // =========================================
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 14),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPurple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded),
            label: const Text('Kembali ke Portofolio'),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PROFIL POLAROID
// ============================================================

class _CuteProfileSection extends StatelessWidget {
  const _CuteProfileSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: kLightPurple,
        borderRadius: BorderRadius.circular(32),
      ),

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // BULATAN PINK
          Positioned(
            right: 0,
            top: 5,
            child: Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                color: kLightPink,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // BINTANG
          Positioned(
            right: 40,
            bottom: 25,
            child: Transform.rotate(
              angle: 0.25,
              child: const Icon(Icons.star_rounded, color: kYellow, size: 48),
            ),
          ),

          // BULATAN BIRU
          Positioned(
            left: 4,
            bottom: 10,
            child: Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                color: kBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =================================
                  // FOTO
                  // =================================
                  Transform.rotate(
                    angle: -0.06,

                    child: Container(
                      width: 128,

                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 28),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            color: kPurple.withOpacity(0.18),
                            blurRadius: 18,
                            offset: const Offset(0, 9),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),

                            child: Image.network(
                              'https://i.ibb.co.com/VYSc9TPr/Whats-App-Image-2026-07-27-at-14-31-31.jpg',

                              width: 112,
                              height: 125,
                              fit: BoxFit.cover,

                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 112,
                                  height: 125,
                                  color: kLightPink,
                                  child: const Icon(
                                    Icons.person_rounded,
                                    color: kPink,
                                    size: 60,
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 17),

                  // =================================
                  // NAMA + ROLE
                  // =================================
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Carlita Wan Pertiwi',
                            style: TextStyle(
                              color: kDark,
                              fontSize: 24,
                              height: 1.15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          SizedBox(height: 10),

                          _RoleBadge(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const _ContactBox(),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ROLE
// ============================================================

class _RoleBadge extends StatelessWidget {
  const _RoleBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: kPurple.withOpacity(0.15)),
      ),

      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.phone_android_rounded, color: kPurple, size: 15),

          SizedBox(width: 6),

          Flexible(
            child: Text(
              'Mobile App Developer',
              style: TextStyle(
                color: kPurple,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// KONTAK
// ============================================================

class _ContactBox extends StatelessWidget {
  const _ContactBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(19),
      ),

      child: const Column(
        children: [
          _ContactRow(
            icon: Icons.email_outlined,
            value: 'carlitaaapertiwii@gmail.com',
            iconColor: kPink,
            iconBackground: kLightPink,
          ),

          Divider(height: 18, color: Color(0xFFECE7F5)),

          _ContactRow(
            icon: Icons.phone_outlined,
            value: '+62 813-1893-9968',
            iconColor: kBlue,
            iconBackground: kLightBlue,
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color iconColor;
  final Color iconBackground;

  const _ContactRow({
    required this.icon,
    required this.value,
    required this.iconColor,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,

          decoration: BoxDecoration(
            color: iconBackground,
            borderRadius: BorderRadius.circular(11),
          ),

          child: Icon(icon, size: 17, color: iconColor),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: kDark,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// TENTANG SAYA
// ============================================================

class _AboutNote extends StatelessWidget {
  const _AboutNote();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.012,

      child: Container(
        padding: const EdgeInsets.fromLTRB(19, 26, 19, 20),

        decoration: BoxDecoration(
          color: kLightYellow,

          borderRadius: BorderRadius.circular(7),

          boxShadow: [
            BoxShadow(
              color: kYellow.withOpacity(0.20),
              blurRadius: 13,
              offset: const Offset(0, 7),
            ),
          ],
        ),

        child: Stack(
          clipBehavior: Clip.none,

          children: [
            Positioned(
              top: -39,
              left: 25,

              child: Container(
                width: 77,
                height: 23,

                decoration: BoxDecoration(
                  color: kPink.withOpacity(0.75),

                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Icon(Icons.edit_note_rounded, color: Color(0xFFD09214)),

                    SizedBox(width: 8),

                    Text(
                      'Tentang Saya',
                      style: TextStyle(
                        color: kDark,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 11),

                Text(
                  'Saya adalah siswa SMKN 1 Leuwimunding jurusan Rekayasa '
                  'Perangkat Lunak (RPL). Saya tertarik dengan dunia teknologi '
                  'dan senang mencoba hal-hal baru. Saya selalu berusaha '
                  'menyelesaikan tugas dengan baik, mudah bekerja sama dengan '
                  'orang lain, dan ingin terus mengembangkan kemampuan yang '
                  'saya miliki untuk bekal di dunia kerja.',

                  textAlign: TextAlign.justify,

                  style: TextStyle(
                    color: Color(0xFF605B52),
                    fontSize: 13.2,
                    height: 1.65,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// JUDUL SECTION
// ============================================================

class _SectionHeader extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final IconData icon;

  const _SectionHeader({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,

          children: [
            Container(
              width: 52,
              height: 52,

              decoration: BoxDecoration(
                color: kLightPurple,

                borderRadius: BorderRadius.circular(17),
              ),
            ),

            Icon(icon, color: kPurple, size: 23),

            Positioned(
              right: -1,
              top: -1,

              child: Container(
                width: 19,
                height: 19,

                alignment: Alignment.center,

                decoration: const BoxDecoration(
                  color: kPink,
                  shape: BoxShape.circle,
                ),

                child: Text(
                  number,

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: const TextStyle(
                  color: kDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              Text(
                subtitle,

                style: const TextStyle(color: kGrey, fontSize: 11.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================
// KEAHLIAN
// ============================================================

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: _whiteCard(),

      child: const Wrap(
        spacing: 10,
        runSpacing: 10,

        children: [
          _SkillSticker(
            label: 'Flutter',
            icon: Icons.flutter_dash_rounded,
            background: kLightBlue,
            iconColor: kBlue,
          ),

          _SkillSticker(
            label: 'Dart',
            icon: Icons.code_rounded,
            background: kLightPurple,
            iconColor: kPurple,
          ),

          _SkillSticker(
            label: 'HTML',
            icon: Icons.html_rounded,
            background: Color(0xFFFFE5D6),
            iconColor: Color(0xFFF47A39),
          ),

          _SkillSticker(
            label: 'CSS',
            icon: Icons.palette_outlined,
            background: kLightBlue,
            iconColor: Color(0xFF357EDB),
          ),

          _SkillSticker(
            label: 'PHP',
            icon: Icons.data_object_rounded,
            background: Color(0xFFEDE8FF),
            iconColor: Color(0xFF6956B7),
          ),

          _SkillSticker(
            label: 'MySQL',
            icon: Icons.storage_rounded,
            background: kLightYellow,
            iconColor: Color(0xFFCF901B),
          ),

          _SkillSticker(
            label: 'UI/UX Design',
            icon: Icons.brush_rounded,
            background: kLightPink,
            iconColor: kPink,
          ),
        ],
      ),
    );
  }
}

class _SkillSticker extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color background;
  final Color iconColor;

  const _SkillSticker({
    required this.label,
    required this.icon,
    required this.background,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(11, 10, 14, 10),

      decoration: BoxDecoration(
        color: background,

        borderRadius: BorderRadius.circular(15),

        border: Border.all(color: iconColor.withOpacity(0.10)),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Container(
            width: 31,
            height: 31,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),

              borderRadius: BorderRadius.circular(10),
            ),

            child: Icon(icon, color: iconColor, size: 18),
          ),

          const SizedBox(width: 8),

          Text(
            label,

            style: const TextStyle(
              color: kDark,
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PENGALAMAN
// ============================================================

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _whiteCard(),

      child: Column(
        children: [
          Container(
            height: 92,

            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [kPink, Color(0xFFFFB86B)]),

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),

            child: Stack(
              children: [
                Positioned(
                  right: -15,
                  top: -20,

                  child: Icon(
                    Icons.ramen_dining_rounded,
                    size: 115,
                    color: Colors.white.withOpacity(0.17),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(17),

                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.white,

                        child: Icon(
                          Icons.storefront_rounded,
                          color: kPink,
                          size: 29,
                        ),
                      ),

                      SizedBox(width: 13),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Berjualan',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 2),

                            Text(
                              'Usaha Mie Sobek',

                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      _YearBadge(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(18),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Berpengalaman mengelola usaha Mie Sobek dengan melayani '
                  'pelanggan, menyiapkan pesanan, mengatur stok bahan, serta '
                  'menjaga kualitas makanan dan kebersihan tempat.',

                  textAlign: TextAlign.justify,

                  style: TextStyle(color: kGrey, fontSize: 13, height: 1.6),
                ),

                SizedBox(height: 15),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,

                  children: [
                    _ExperienceTag(
                      text: 'Pelayanan',
                      icon: Icons.support_agent_rounded,
                    ),

                    _ExperienceTag(
                      text: 'Stok Bahan',
                      icon: Icons.inventory_2_outlined,
                    ),

                    _ExperienceTag(
                      text: 'Kebersihan',
                      icon: Icons.cleaning_services_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _YearBadge extends StatelessWidget {
  const _YearBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.20),

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: Colors.white.withOpacity(0.35)),
      ),

      child: const Text(
        '2023\nSekarang',
        textAlign: TextAlign.center,

        style: TextStyle(
          color: Colors.white,
          fontSize: 9.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ExperienceTag extends StatelessWidget {
  final String text;
  final IconData icon;

  const _ExperienceTag({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),

      decoration: BoxDecoration(
        color: kLightPink,

        borderRadius: BorderRadius.circular(13),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, color: kPink, size: 14),

          const SizedBox(width: 5),

          Text(
            text,

            style: const TextStyle(
              color: kDark,
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PENDIDIKAN
// ============================================================

class _EducationTimeline extends StatelessWidget {
  const _EducationTimeline();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),

      decoration: _whiteCard(),

      child: const Column(
        children: [
          _EducationItem(
            school: 'TK NURUL FALAH',
            year: '2013 – 2014',
            icon: Icons.child_care_rounded,
            color: kPink,
            background: kLightPink,
          ),

          _TimelineLine(),

          _EducationItem(
            school: 'SDN 3 PANJALIN KIDUL',
            year: '2014 – 2021',
            icon: Icons.menu_book_rounded,
            color: kBlue,
            background: kLightBlue,
          ),

          _TimelineLine(),

          _EducationItem(
            school: 'MTS PRAKARYA PUI PANJALIN',
            year: '2021 – 2023',
            icon: Icons.auto_stories_rounded,
            color: Color(0xFFE5A42C),
            background: kLightYellow,
          ),

          _TimelineLine(),

          _EducationItem(
            school: 'SMKN 1 LEUWIMUNDING',
            year: '2024 – Sekarang',
            description: 'Rekayasa Perangkat Lunak',
            icon: Icons.computer_rounded,
            color: kPurple,
            background: kLightPurple,
            active: true,
          ),
        ],
      ),
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String school;
  final String year;
  final String description;
  final IconData icon;
  final Color color;
  final Color background;
  final bool active;

  const _EducationItem({
    required this.school,
    required this.year,
    required this.icon,
    required this.color,
    required this.background,
    this.description = '',
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: background,

              borderRadius: BorderRadius.circular(15),

              border: active
                  ? Border.all(color: kPurple.withOpacity(0.25), width: 2)
                  : null,
            ),

            child: Icon(icon, color: color, size: 22),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  school,

                  style: const TextStyle(
                    color: kDark,
                    fontSize: 13.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (description.isNotEmpty) ...[
                  const SizedBox(height: 3),

                  Text(
                    description,

                    style: TextStyle(
                      color: color,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],

                const SizedBox(height: 3),

                Text(year, style: const TextStyle(color: kGrey, fontSize: 11)),
              ],
            ),
          ),

          if (active)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),

              decoration: BoxDecoration(
                color: const Color(0xFFE2F8EF),

                borderRadius: BorderRadius.circular(20),
              ),

              child: const Text(
                'Aktif',

                style: TextStyle(
                  color: Color(0xFF36846A),
                  fontSize: 9.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TimelineLine extends StatelessWidget {
  const _TimelineLine();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 48,
          height: 22,

          child: Center(
            child: Container(width: 2, height: 22, color: kLightPurple),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// FOOTER
// ============================================================

class _FooterQuote extends StatelessWidget {
  const _FooterQuote();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(21),

      decoration: BoxDecoration(
        color: kDark,

        borderRadius: BorderRadius.circular(27),
      ),

      child: Stack(
        children: [
          Positioned(
            right: -8,
            bottom: -18,

            child: Icon(
              Icons.rocket_launch_rounded,
              color: kPink.withOpacity(0.25),
              size: 90,
            ),
          ),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                '“',

                style: TextStyle(
                  color: kYellow,
                  fontSize: 55,
                  height: 0.8,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(width: 9),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Terus belajar, mencoba hal baru, dan jangan takut '
                      'membuat kesalahan.',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.5,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 7),

                    Text(
                      '— Carlita Wan Pertiwi',

                      style: TextStyle(color: Colors.white60, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DEKORASI KARTU PUTIH
// ============================================================

BoxDecoration _whiteCard() {
  return BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(25),

    border: Border.all(color: const Color(0xFFF0EAF4)),

    boxShadow: [
      BoxShadow(
        color: kPurple.withOpacity(0.07),
        blurRadius: 19,
        offset: const Offset(0, 8),
      ),
    ],
  );
}