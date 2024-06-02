import 'package:flutter/material.dart';

class LaporanPerPeriode extends StatefulWidget {
  const LaporanPerPeriode({super.key});

  @override
  State<LaporanPerPeriode> createState() => _LaporanPerPeriodeState();
}

class _LaporanPerPeriodeState extends State<LaporanPerPeriode> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Atma Kitchen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Jl. Centralpark No. 10 Yogyakarta',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          const Text(
            'LAPORAN Penggunaan Bahan Baku',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Periode: 5 Januari 2024 - 27 Januari 2024',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Tanggal cetak: Tanggal cetak:  $day/$month/$year',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          DataTable(
            columns: const [
              DataColumn(label: Text('Nama Bahan')),
              DataColumn(label: Text('Satuan')),
              DataColumn(label: Text('Digunakan')),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text('Susu Cair')),
                  DataCell(Text('ml')),
                  DataCell(Text('20.000')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Gula pasir')),
                  DataCell(Text('gram')),
                  DataCell(Text('2.750')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Box 20x20')),
                  DataCell(Text('pcs')),
                  DataCell(Text('154')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Botol 1 Liter')),
                  DataCell(Text('pcs')),
                  DataCell(Text('215')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
