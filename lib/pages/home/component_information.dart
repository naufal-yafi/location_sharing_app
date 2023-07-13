import 'package:flutter/material.dart';
import 'component_card.dart';

Column information(BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {},
        child: card(
            context,
            'Kirim Lokasi',
            'Berbagi lokasi kepada teman anda dan tambahkan pesan singkat.',
            'Bagikan Lokasimu',
            false,
            Icon(
              Icons.location_on,
              color: Colors.blue.shade600,
              size: 20,
            )),
      ),
      const SizedBox(
        height: 15,
      ),
      InkWell(
        onTap: () {},
        child: card(
            context,
            'Dapatkan Lokasi Temanmu',
            'Dapatkan lokasi dan pesan singkat dari temanmu dari kode yang dibagikan.',
            'Lihat Dimana Temanmu Sekarang',
            true,
            const Icon(
              Icons.location_searching,
              color: Colors.white,
              size: 20,
            )),
      ),
      const SizedBox(
        height: 15,
      ),
      InkWell(
        onTap: () {},
        child: card(
            context,
            'Lihat Kode',
            'Lihat semua kode yang sudah kamu bagikan.',
            'Lihat Kode yang Tersedia ',
            false,
            Icon(
              Icons.book,
              color: Colors.blue.shade600,
              size: 20,
            )),
      ),
    ],
  );
}
