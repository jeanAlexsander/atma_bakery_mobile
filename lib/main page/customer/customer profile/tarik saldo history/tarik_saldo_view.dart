import 'package:atma_bakery_mobile/main%20page/customer/customer%20profile/tarik%20saldo%20history/tarik_saldo_controller.dart';
import 'package:atma_bakery_mobile/main%20page/customer/customer%20profile/tarik%20saldo%20history/tarik_saldo_model.dart';
import 'package:flutter/material.dart';

class TarikSaldoView extends StatefulWidget {
  const TarikSaldoView({super.key});

  @override
  State<TarikSaldoView> createState() => _TarikSaldoViewState();
}

class _TarikSaldoViewState extends State<TarikSaldoView> {
  late Future<TarikSaldoModel> _tarikSaldoModel;

  @override
  void initState() {
    super.initState();
    _tarikSaldoModel = TarikSaldoController.fetchHistorySaldo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("tarik saldo"),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: _tarikSaldoModel,
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
                      TarikSaldo data = snapshot.data!.data[index];
                      return Card(
                        child: ListTile(
                          title: Text(data.amount.toString()),
                          subtitle: Text(
                            data.balanceWithdrawalsDate.toString(),
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
      ),
    );
  }
}
