import 'package:flutter/material.dart';

class LaporanPemasukanPengeluaranView extends StatefulWidget {
  const LaporanPemasukanPengeluaranView({Key? key}) : super(key: key);

  @override
  State<LaporanPemasukanPengeluaranView> createState() =>
      _LaporanPemasukanPengeluaranViewState();
}

class _LaporanPemasukanPengeluaranViewState
    extends State<LaporanPemasukanPengeluaranView> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Atma Kitchen',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Jl. Centralpark No. 10 Yogyakarta',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'LAPORAN PEMASUKAN DAN PENGELUARAN ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Bulan: $month'),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Tahun: 2023'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Tanggal cetak:  $day/$month/$year'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(
                color: Colors.black,
                width: 1.0,
              ),
              children: const [
                TableRow(
                  children: [
                    Text(
                      '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Pemasukan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Pengeluaran',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Januari'),
                    Text('207'),
                    Text(''),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Februari'),
                    Text('254'),
                    Text(''),
                  ],
                ),
                TableRow(
                  children: [
                    Text('....'),
                    Text('....'),
                    Text('....'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('November'),
                    Text('....'),
                    Text('2000'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Desember'),
                    Text('....'),
                    Text('....'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Total'),
                    Text(
                      '1000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '3000',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
