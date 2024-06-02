import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_pemasukan_pengeluaran_view.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_penggunaan_per_periode_view.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_stock_bahan_baku_view.dart';
import 'package:flutter/material.dart';

class LaporanMainView extends StatefulWidget {
  const LaporanMainView({super.key});

  @override
  State<LaporanMainView> createState() => _LaporanMainViewState();
}

class _LaporanMainViewState extends State<LaporanMainView> {
  final _pages = <Widget>[
    const LaporanBahanBaku(),
    const LaporanPerPeriode(),
    const LaporanPemasukanPengeluaranView()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: const Text("bahan Baku"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: const Text("periode"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: const Text("In Out"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: SizedBox(
                    height: 600,
                    child: SingleChildScrollView(
                      child: _pages[index],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
