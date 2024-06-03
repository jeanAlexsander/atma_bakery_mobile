import 'package:flutter/material.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_pemasukan_pengeluaran_controller.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_pemasukan_pengeluaran_model.dart';

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
  late Future<LaporanPengeluaranPemasukanModel>
      laporanPengeluaranPemasukanModel;
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
    laporanPengeluaranPemasukanModel =
        LaporanPemasukanPengeluaranController.fetchData(monthValue);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: DropdownButton<String>(
              // Tambahkan generic type <String>
              value: monthValue,
              onChanged: (value) {
                setState(() {
                  monthValue = value.toString();
                  laporanPengeluaranPemasukanModel =
                      LaporanPemasukanPengeluaranController.fetchData(
                          value.toString());
                });
              },
              items: monthNames.map((String value) {
                return DropdownMenuItem<String>(
                  // Tambahkan generic type <String>
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
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
            child: Text('Bulan: $monthValue'),
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
            child: FutureBuilder<LaporanPengeluaranPemasukanModel>(
              future: laporanPengeluaranPemasukanModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(""),
                      ),
                      DataColumn(
                        label: Text("Pemasukan"),
                      ),
                      DataColumn(
                        label: Text("Pengeluaran"),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(
                          Text("penjualan"),
                        ),
                        DataCell(
                          Text(
                            snapshot.data!.data.totalPemasukan.toString(),
                          ),
                        ),
                        const DataCell(Text(""))
                      ]),
                      DataRow(cells: [
                        const DataCell(
                          Text("tip"),
                        ),
                        DataCell(
                          Text(
                            snapshot.data!.data.tip.toString(),
                          ),
                        ),
                        const DataCell(Text(""))
                      ]),
                      DataRow(cells: [
                        const DataCell(
                          Text("Gaji Karyawan"),
                        ),
                        const DataCell(Text("")),
                        DataCell(
                          Text(
                            snapshot.data!.data.totalGaji.toString(),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(
                          Text("Bahan Baku"),
                        ),
                        const DataCell(Text("")),
                        DataCell(
                          Text(
                            snapshot.data!.data.totalPembelianBahan.toString(),
                          ),
                        ),
                      ]),
                      ...snapshot.data!.data.otherNeed.map(
                        (e) => DataRow(
                          cells: [
                            DataCell(Text(e.name)),
                            const DataCell(Text("")),
                            DataCell(Text(e.cost.toString())),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
