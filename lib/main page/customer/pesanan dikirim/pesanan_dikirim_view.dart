import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/detail%20pesanan/detail_pesanan_view.dart';
import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/pesanan_dikirim_controller.dart';
import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/pesanan_dikirim_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PesananDikirimView extends StatefulWidget {
  const PesananDikirimView({super.key});

  @override
  State<PesananDikirimView> createState() => _PesananDikirimViewState();
}

class _PesananDikirimViewState extends State<PesananDikirimView> {
  late Future<PesananDikirimModel> _pesananDikirimModel;

  @override
  void initState() {
    super.initState();
    _pesananDikirimModel = PesananDikirimController.fetchPesananDikirim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Dikirim"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: _pesananDikirimModel,
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
                    PesananDikirim data = snapshot.data!.data[index];
                    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
                    String formattedDateTime = formatter.format(data.orderDate);
                    return Card(
                      child: ListTile(
                        title: Text(data.orderId.toString()),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formattedDateTime.toString(),
                            ),
                            Text(data.statusOrder.toString())
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPesananView(
                                  orderDate: formattedDateTime.toString(),
                                  orderId: data.orderId.toString(),
                                ),
                              ),
                            );
                          },
                          child: const Text('Detail'),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
