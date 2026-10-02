import 'dart:ui';
import 'package:flutter/material.dart';

class SopyanCvPage extends StatelessWidget {
  const SopyanCvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F19),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: const Color(0xFF0B0F19),
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: const Color(0xFF1E293B).withOpacity(0.8),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF10B981),
                    size: 18,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Color(0xFF1E293B), Color(0xFF0B0F19)],
                        center: Alignment(0, -0.5),
                        radius: 1.2,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF10B981), Color(0xFF3B82F6)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF10B981).withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://i.ibb.co.com/Hp2j9q45/oscarsport-75.jpg',
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'MUHAMMAD SOPYAN',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF10B981).withOpacity(0.3),
                          ),
                        ),
                        child: const Text(
                          'Flutter Developer & Striker',
                          style: TextStyle(
                            color: Color(0xFF10B981),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SopyanCardModern(
                    title: 'Kontak',
                    icon: Icons.alternate_email_rounded,
                    child: Column(
                      children: [
                        ContactItemModern(
                          icon: Icons.email_outlined,
                          text: 'pyannzutt@email.com',
                        ),
                        ContactItemModern(
                          icon: Icons.phone_android_outlined,
                          text: '+62 800-6000-5000',
                        ),
                        ContactItemModern(
                          icon: Icons.location_on_outlined,
                          text: '17 Agustus 1945, lahir di Portugal',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  const SopyanCardModern(
                    title: 'Tentang Saya',
                    icon: Icons.person_outline_rounded,
                    child: Text(
                      'Saya seorang pemain sepak bola profesional '
                      'yang ingin di-naturalisasi kewarganegaraan '
                      'Indonesia. Saya ingin membela tanah lahir '
                      'mamah saya.',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        height: 1.6,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const SopyanCardModern(
                    title: 'Pengalaman Kerja',
                    icon: Icons.work_outline_rounded,
                    child: Column(
                      children: [
                        SopyanExperienceModern(
                          title: 'PEMAIN BOLA - PERSIB',
                          subtitle: 'Striker Utama',
                          period: '2023 - Sekarang',
                        ),
                        SizedBox(height: 12),
                        SopyanExperienceModern(
                          title: 'AKADEMI PERSIB',
                          subtitle: 'Gelandang Utama',
                          period: '2021 - 2023',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  const SopyanCardModern(
                    title: 'Keahlian',
                    icon: Icons.stars_rounded,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 10,
                      children: [
                        SkillChipModern(label: 'Jugling Bola'),
                        SkillChipModern(label: 'Menendang Bola'),
                        SkillChipModern(label: 'Control Bola'),
                        SkillChipModern(label: 'Shooting Bola'),
                        SkillChipModern(
                          label: 'Nyeleding Orang',
                          isHighlight: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF10B981), Color(0xFF059669)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF10B981).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Kembali ke Portofolio',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
    );
  }
}

class SopyanCardModern extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const SopyanCardModern({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.08),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: const Color(0xFF10B981), size: 20),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class ContactItemModern extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactItemModern({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF64748B), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFFE2E8F0), fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class SopyanExperienceModern extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;

  const SopyanExperienceModern({
    super.key,
    required this.title,
    required this.subtitle,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withOpacity(0.6),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF10B981),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF334155),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              period,
              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillChipModern extends StatelessWidget {
  final String label;
  final bool isHighlight;

  const SkillChipModern({
    super.key,
    required this.label,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isHighlight
            ? const Color(0xFFEF4444).withOpacity(0.15)
            : const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isHighlight
              ? const Color(0xFFEF4444).withOpacity(0.4)
              : Colors.white.withOpacity(0.1),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isHighlight
              ? const Color(0xFFFCA5A5)
              : const Color(0xFFE2E8F0),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
