import 'package:atma_bakery_mobile/main%20page/customer/home%20page/customer_home_page._view.dart';
import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/pesanan_dikirim_view.dart';
import 'package:flutter/material.dart';
import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/detail%20pesanan/detail_pesanan_controller.dart';
import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/detail%20pesanan/detail_pesanan_model.dart';

class DetailPesananView extends StatefulWidget {
  const DetailPesananView({
    super.key,
    required this.orderId,
    required this.orderDate,
  });

  final String orderId;
  final String orderDate;

  @override
  State<DetailPesananView> createState() => _DetailPesananViewState();
}

class _DetailPesananViewState extends State<DetailPesananView> {
  late Future<DetailPesananModel> _detailPesananModel;

  @override
  void initState() {
    super.initState();
    _detailPesananModel =
        DetailPesananController.fetchDetailPesanan(widget.orderDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pesanan"),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: _detailPesananModel,
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
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      DetailPesanan data = snapshot.data!.data[index];
                      return Card(
                        child: ListTile(
                          title: Text(data.name.toString()),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Harga Satuan ${data.price}",
                              ),
                              Text("Total Bayar ${data.amount}")
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Apakah Pesanan Sudah Diterima?'),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                                const SizedBox(width: 20),
                                TextButton(
                                  onPressed: () {
                                    DetailPesananController
                                        .updateStatusPengiriman(widget.orderId);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomerHomepage(),
                                      ),
                                    );
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text("Pesanan Diterima"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
