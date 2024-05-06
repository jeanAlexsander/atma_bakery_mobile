import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/customer/history/customer_history_controller.dart';
import 'package:atma_bakery_mobile/main%20page/customer/history/customer_history_model.dart';
import 'package:flutter/material.dart';

class CustomerHistoryView extends StatefulWidget {
  const CustomerHistoryView({super.key});

  @override
  State<CustomerHistoryView> createState() => _CustomerHistoryViewState();
}

class _CustomerHistoryViewState extends State<CustomerHistoryView> {
  final TextEditingController _searchController = TextEditingController();
  late Future<HistoryModel> historyModel;
  late Future<HistoryModel> tempModel;
  String search = '';

  @override
  void initState() {
    super.initState();
    historyModel = CustomerHistoryController.fetchCustomerHistory();
    tempModel = historyModel;
  }

  void _performSearch(String value) {
    setState(() {
      search = value.toLowerCase();
      historyModel = tempModel.then((model) {
        return HistoryModel(
          status: model.status,
          message: model.message,
          data: model.data.where((history) {
            return history.name.toLowerCase().contains(search);
          }).toList(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Search Product",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _performSearch(_searchController.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.blue.shade300,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              "History of your purchase",
              style: kTextFieldStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<HistoryModel>(
              future: historyModel,
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
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      History history = snapshot.data!.data[index];
                      return Card(
                        child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/Logo Kue.png",
                              ),
                            ),
                            title: Text(
                              history.name,
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "Price: ${history.price}",
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Quantity: ${history.quantity}",
                                ),
                              ],
                            )),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
