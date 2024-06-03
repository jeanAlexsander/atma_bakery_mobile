import 'package:flutter/material.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_penggunaan_per_periode_controller.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_penggunaan_per_periode_modal.dart';

class LaporanPerPeriode extends StatefulWidget {
  const LaporanPerPeriode({Key? key}) : super(key: key);

  @override
  State<LaporanPerPeriode> createState() => _LaporanPerPeriodeState();
}

class _LaporanPerPeriodeState extends State<LaporanPerPeriode> {
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  late Future<LaporanPerPeriodeModel> laporanPerPeriodeModel;

  final List<String> monthNames = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];
  String monthValue = "Januari";
  @override
  void initState() {
    super.initState();
    laporanPerPeriodeModel = LaporanPerPeriodeController.fetchData(monthValue);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: DropdownButton(
              value: monthValue,
              onChanged: (value) {
                setState(() {
                  monthValue = value.toString();
                  laporanPerPeriodeModel =
                      LaporanPerPeriodeController.fetchData(value.toString());
                });
              },
              items: monthNames.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
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
          Text(
            'Periode: $monthValue',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            'Tanggal cetak: $day/$month/$year',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          FutureBuilder<LaporanPerPeriodeModel>(
            future: laporanPerPeriodeModel,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return DataTable(
                  columns: const [
                    DataColumn(label: Text('Nama Bahan')),
                    DataColumn(label: Text('Satuan')),
                    DataColumn(label: Text('Digunakan')),
                  ],
                  rows: snapshot.data!.data.map((laporanPerPeriode) {
                    return DataRow(
                      cells: [
                        DataCell(Text(laporanPerPeriode.name)),
                        DataCell(Text(laporanPerPeriode.unit)),
                        DataCell(Text(laporanPerPeriode.quantity.toString())),
                      ],
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
