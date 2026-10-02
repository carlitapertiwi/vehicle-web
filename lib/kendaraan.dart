import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'tambah.dart';
import 'edit.dart';

class KendaraanPage extends StatefulWidget {
  const KendaraanPage({super.key});

  @override
  State<KendaraanPage> createState() => _KendaraanPageState();
}

class _KendaraanPageState extends State<KendaraanPage> {
  List<Map<String, dynamic>> dataKendaraan = [];

  bool loading = true;

  final String baseUrl =
      (Uri.base.host == 'localhost' || Uri.base.host == '127.0.0.1')
      ? 'http://localhost/kendaraan1_api'
      : 'https://vehiclehub-smkn1.site.je/kendaraan1_api';

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  Future<void> ambilData() async {
    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse('$baseUrl/kendaraan.php'));

      final hasil = jsonDecode(response.body);

      if (hasil['success'] == true) {
        final List list = hasil['data'];

        setState(() {
          dataKendaraan = list
              .map((item) => Map<String, dynamic>.from(item))
              .toList();
        });
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal mengambil data: $e')));
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  Future<void> tambahData() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TambahPage()),
    );

    if (hasil == true) {
      await ambilData();
    }
  }

  Future<void> editData(Map<String, dynamic> data) async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditPage(data: data)),
    );

    if (hasil == true) {
      await ambilData();
    }
  }

  Future<void> hapusData(Map<String, dynamic> data) async {
    final bool? yakin = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Data'),
          content: const Text('Yakin ingin menghapus kendaraan ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (yakin != true) return;

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/hapus.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id': data['id']}),
      );

      final hasil = jsonDecode(response.body);

      if (!mounted) return;

      if (hasil['success'] == true) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Data berhasil dihapus')));

        await ambilData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(hasil['message'] ?? 'Gagal menghapus data')),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal terhubung ke server: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD9F1FF),
              Color(0xFFAEDCFF),
              Color(0xFF4A91D3),
              Color(0xFF082D58),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF082D58),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Text(
                        'Data Kendaraan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF082D58),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: ambilData,
                      icon: const Icon(
                        Icons.refresh_rounded,
                        color: Color(0xFF082D58),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: loading
                    ? const Center(child: CircularProgressIndicator())
                    : dataKendaraan.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.directions_car_outlined,
                              size: 80,
                              color: Colors.white,
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Belum ada data kendaraan',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: ambilData,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 5,
                          ),
                          itemCount: dataKendaraan.length,
                          itemBuilder: (context, index) {
                            final data = dataKendaraan[index];

                            final String gambar =
                                data['gambar']?.toString() ?? '';

                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.90),
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: gambar.isNotEmpty
                                        ? Image.network(
                                            '$baseUrl/gambar.php?file=${Uri.encodeComponent(gambar)}',
                                            width: 90,
                                            height: 90,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return _gambarKosong();
                                                },
                                          )
                                        : _gambarKosong(),
                                  ),

                                  const SizedBox(width: 14),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['nama_kendaraan']?.toString() ??
                                              '-',
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF0B345F),
                                          ),
                                        ),

                                        const SizedBox(height: 5),

                                        Text(
                                          '${data['jenis'] ?? '-'} • ${data['merk'] ?? '-'} • ${data['tahun'] ?? '-'}',
                                          style: const TextStyle(
                                            color: Color(0xFF63819E),
                                          ),
                                        ),

                                        const SizedBox(height: 3),

                                        Text(
                                          '${data['warna'] ?? '-'} • Rp ${data['harga'] ?? '-'}',
                                          style: const TextStyle(
                                            color: Color(0xFF63819E),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          editData(data);
                                        },
                                        icon: const Icon(
                                          Icons.edit_rounded,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          hapusData(data);
                                        },
                                        icon: const Icon(
                                          Icons.delete_rounded,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: tambahData,
        backgroundColor: const Color(0xFF174D84),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Tambah'),
      ),
    );
  }

  Widget _gambarKosong() {
    return Container(
      width: 90,
      height: 90,
      color: const Color(0xFFE3F2FD),
      child: const Icon(
        Icons.directions_car_rounded,
        size: 40,
        color: Color(0xFF3976A8),
      ),
    );
  }
}
