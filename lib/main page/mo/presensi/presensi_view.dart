import 'package:flutter/material.dart';
import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/mo/presensi/presensi_controller.dart';
import 'package:atma_bakery_mobile/main%20page/mo/presensi/presensi_model.dart';

class PresensiView extends StatefulWidget {
  const PresensiView({Key? key}) : super(key: key);

  @override
  State<PresensiView> createState() => _PresensiViewState();
}

class _PresensiViewState extends State<PresensiView> {
  late Future<PresensiModel> presensiModel;

  @override
  void initState() {
    super.initState();
    presensiModel = PresensiController.fetchPresensiModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              "Employee attendance",
              style: kTextFieldStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<PresensiModel>(
              future: presensiModel,
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
                      Presensi presensi = snapshot.data!.data[index];
                      return Card(
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/Logo Kue.png",
                            ),
                          ),
                          title: Text(
                            "${presensi.firstName} ${presensi.lastName}",
                          ),
                          subtitle: Text(
                            "Time: ${presensi.status == 0 ? "Not Yet" : "Checked"}",
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              PresensiController.setPresensi(
                                      presensi.attendanceId)
                                  .then((updatedPresensiModel) {
                                setState(() {
                                  presensiModel =
                                      Future.value(updatedPresensiModel);
                                });
                              }).catchError((error) {
                                throw ('Error: $error');
                              });
                            },
                            child: const Text("Check"),
                          ),
                        ),
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
