import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class EditPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const EditPage({super.key, required this.data});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController namaController;
  late TextEditingController jenisController;
  late TextEditingController merkController;
  late TextEditingController tahunController;
  late TextEditingController warnaController;
  late TextEditingController hargaController;

  final String baseUrl =
      (Uri.base.host == 'localhost' || Uri.base.host == '127.0.0.1')
      ? 'http://localhost/kendaraan1_api'
      : 'https://vehiclehub-smkn1.site.je/kendaraan1_api';

  final ImagePicker picker = ImagePicker();

  XFile? gambarBaru;
  Uint8List? gambarBytes;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.data['nama_kendaraan']?.toString() ?? '',
    );
    jenisController = TextEditingController(
      text: widget.data['jenis']?.toString() ?? '',
    );
    merkController = TextEditingController(
      text: widget.data['merk']?.toString() ?? '',
    );
    tahunController = TextEditingController(
      text: widget.data['tahun']?.toString() ?? '',
    );
    warnaController = TextEditingController(
      text: widget.data['warna']?.toString() ?? '',
    );
    hargaController = TextEditingController(
      text: widget.data['harga']?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    jenisController.dispose();
    merkController.dispose();
    tahunController.dispose();
    warnaController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  Future<void> pilihGambar() async {
    final XFile? hasil = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (hasil != null) {
      final bytes = await hasil.readAsBytes();

      setState(() {
        gambarBaru = hasil;
        gambarBytes = bytes;
      });
    }
  }

  Future<void> updateData() async {
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
      final uri = Uri.parse('$baseUrl/edit.php');
      final request = http.MultipartRequest('POST', uri);

      request.fields['id'] = widget.data['id'].toString();
      request.fields['nama_kendaraan'] = namaController.text;
      request.fields['jenis'] = jenisController.text;
      request.fields['merk'] = merkController.text;
      request.fields['tahun'] = tahunController.text;
      request.fields['warna'] = warnaController.text;
      request.fields['harga'] = hargaController.text;

      // gambar lama
      request.fields['gambar_lama'] = widget.data['gambar']?.toString() ?? '';

      // kalau user pilih gambar baru
      if (gambarBaru != null && gambarBytes != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'gambar',
            gambarBytes!,
            filename: gambarBaru!.name,
          ),
        );
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      // untuk debug: lihat balasan asli server di console
      debugPrint('RESPON EDIT: $responseBody');

      final data = jsonDecode(responseBody);

      if (!mounted) return;

      if (data['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data kendaraan berhasil diubah')),
        );

        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? 'Gagal mengubah data')),
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
    final String gambarLama = widget.data['gambar']?.toString() ?? '';

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
                      'Edit Kendaraan',
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
                    child: gambarBytes != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.memory(
                              gambarBytes!,
                              width: double.infinity,
                              height: 190,
                              fit: BoxFit.cover,
                            ),
                          )
                        : gambarLama.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              '$baseUrl/gambar.php?file=${Uri.encodeComponent(gambarLama)}',
                              width: double.infinity,
                              height: 190,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const _FotoKosong();
                              },
                            ),
                          )
                        : const _FotoKosong(),
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
                          onPressed: loading ? null : updateData,
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
                                  'Update Kendaraan',
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

class _FotoKosong extends StatelessWidget {
  const _FotoKosong();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_rounded,
          size: 55,
          color: Color(0xFF3976A8),
        ),
        SizedBox(height: 10),
        Text(
          'Ganti Foto Kendaraan',
          style: TextStyle(
            color: Color(0xFF174D84),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Tekan untuk memilih dari galeri',
          style: TextStyle(fontSize: 12, color: Color(0xFF63819E)),
        ),
      ],
    );
  }
}