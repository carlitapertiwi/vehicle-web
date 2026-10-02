import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class TambahPage extends StatefulWidget {
  const TambahPage({super.key});

  @override
  State<TambahPage> createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {
  final namaController = TextEditingController();
  final jenisController = TextEditingController();
  final merkController = TextEditingController();
  final tahunController = TextEditingController();
  final warnaController = TextEditingController();
  final hargaController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  XFile? gambar;
  Uint8List? gambarBytes;

  bool loading = false;

  final String baseUrl =
      (Uri.base.host == 'localhost' || Uri.base.host == '127.0.0.1')
      ? 'http://localhost/kendaraan1_api'
      : 'https://vehiclehub-smkn1.site.je/kendaraan1_api';

  Future<void> pilihGambar() async {
    final XFile? hasil = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (hasil != null) {
      final bytes = await hasil.readAsBytes();

      setState(() {
        gambar = hasil;
        gambarBytes = bytes;
      });
    }
  }

  Future<void> simpanData() async {
    if (namaController.text.isEmpty ||
        jenisController.text.isEmpty ||
        merkController.text.isEmpty ||
        tahunController.text.isEmpty ||
        warnaController.text.isEmpty ||
        hargaController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Semua data wajib diisi')));
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final uri = Uri.parse('$baseUrl/tambah.php');

      final request = http.MultipartRequest('POST', uri);

      request.fields['nama_kendaraan'] = namaController.text;
      request.fields['jenis'] = jenisController.text;
      request.fields['merk'] = merkController.text;
      request.fields['tahun'] = tahunController.text;
      request.fields['warna'] = warnaController.text;
      request.fields['harga'] = hargaController.text;

      if (gambar != null && gambarBytes != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'gambar',
            gambarBytes!,
            filename: gambar!.name,
          ),
        );
      }

      final response = await request.send();

      final responseBody = await response.stream.bytesToString();
      print(responseBody);

      final data = jsonDecode(responseBody);

      if (!mounted) return;

      if (data['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kendaraan berhasil ditambahkan')),
        );

        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['message'] ?? 'Gagal menyimpan kendaraan'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal terhubung ke server: $e')));
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
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
                    const Text(
                      'Tambah Kendaraan',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF082D58),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                GestureDetector(
                  onTap: pilihGambar,
                  child: Container(
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.80),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: gambarBytes == null
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate_rounded,
                                size: 55,
                                color: Color(0xFF3976A8),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Pilih Foto Kendaraan',
                                style: TextStyle(
                                  color: Color(0xFF174D84),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Tekan untuk memilih foto',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF63819E),
                                ),
                              ),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.memory(
                              gambarBytes!,
                              width: double.infinity,
                              height: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 18),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.84),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      _field(
                        namaController,
                        'Nama Kendaraan',
                        Icons.directions_car_rounded,
                      ),
                      _field(
                        jenisController,
                        'Jenis (Motor/Mobil)',
                        Icons.category_outlined,
                      ),
                      _field(merkController, 'Merk', Icons.sell_outlined),
                      _field(
                        tahunController,
                        'Tahun',
                        Icons.calendar_month_outlined,
                        number: true,
                      ),
                      _field(warnaController, 'Warna', Icons.palette_outlined),
                      _field(
                        hargaController,
                        'Harga',
                        Icons.payments_outlined,
                        number: true,
                      ),

                      const SizedBox(height: 8),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: loading ? null : simpanData,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF174D84),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: loading
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Simpan Kendaraan',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String hint,
    IconData icon, {
    bool number = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: TextField(
        controller: controller,
        keyboardType: number ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF3976A8)),
          filled: true,
          fillColor: const Color(0xFFF3F9FF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
