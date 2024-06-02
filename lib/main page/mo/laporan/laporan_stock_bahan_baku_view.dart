import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_stock_bahan_baku_controller.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_stock_bahan_baku_model.dart';
import 'package:flutter/material.dart';

class LaporanBahanBaku extends StatefulWidget {
  const LaporanBahanBaku({Key? key}) : super(key: key);

  @override
  State<LaporanBahanBaku> createState() => _LaporanBahanBakuState();
}

class _LaporanBahanBakuState extends State<LaporanBahanBaku> {
  late Future<StockBahanBakuModel> stockBahanBakuModel;

  @override
  void initState() {
    super.initState();
    stockBahanBakuModel = StockBahanBakuController.fetchStockBahanBaku();
  }

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
          FutureBuilder<StockBahanBakuModel>(
            future: stockBahanBakuModel,
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
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Nama Bahan')),
                      DataColumn(label: Text('Satuan')),
                      DataColumn(label: Text('Digunakan')),
                    ],
                    rows: snapshot.data!.data.map((stockBahanBaku) {
                      return DataRow(
                        cells: [
                          DataCell(Text(stockBahanBaku.name)),
                          DataCell(Text(stockBahanBaku.unit)),
                          DataCell(Text(stockBahanBaku.amount.toString())),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
