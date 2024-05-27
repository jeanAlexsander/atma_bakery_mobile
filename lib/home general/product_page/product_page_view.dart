import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/home%20general/product_page/all_product_controller.dart';
import 'package:atma_bakery_mobile/home%20general/product_page/all_product_model.dart';
import 'package:atma_bakery_mobile/home%20general/product_page/today_product_controller.dart';
import 'package:atma_bakery_mobile/home%20general/product_page/today_product_model.dart';
import 'package:flutter/material.dart';

class ProductPageView extends StatefulWidget {
  const ProductPageView({Key? key}) : super(key: key);

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  final String urlImage = "http://10.0.2.2:8000/images/bluecake1.jpg";
  late Future<AllProductModel> allProductModel;
  late Future<TodayProductModel> todayProductModel;

  @override
  void initState() {
    super.initState();
    allProductModel = AllProductService.fetchAllProductData();
    todayProductModel = TodayProductController.fetchTodayProductData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Search product',
                          hintText: "Search",
                          labelStyle: kTextFieldStyle,
                          hintStyle: kTextFieldStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          suffixIcon: Icon(Icons.search),
                        ),
                        style: kTextFieldStyle.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.notifications),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Our Product",
                  style: kTextFieldStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: FutureBuilder(
                    future: allProductModel,
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
                        if (snapshot.data!.data.isEmpty) {
                          return const Center(
                            child: Text('Data is empty'),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              AllProduct allProduct =
                                  snapshot.data!.data[index];
                              String newImageUrl = allProduct.image == ''
                                  ? urlImage
                                  : allProduct.image
                                      .replaceAll("127.0.0.1", "10.0.2.2");
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 150,
                                  height: 230,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[300],
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.grey[300],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            newImageUrl,
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                            errorBuilder: (BuildContext context,
                                                Object error,
                                                StackTrace? stackTrace) {
                                              return Container(
                                                color: Colors
                                                    .grey, // warna placeholder jika terjadi kesalahan
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.error_outline,
                                                    color: Colors.red,
                                                    size: 48.0,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  allProduct.name.length > 20
                                                      ? '${allProduct.name.substring(0, 10)}...'
                                                      : allProduct.name,
                                                  style:
                                                      kTextFieldStyle.copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "Rp. ${allProduct.price}",
                                                  style: kTextFieldStyle,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                98, 102, 206, 244),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                            const Size(
                                              100,
                                              25,
                                            ),
                                          ),
                                          elevation:
                                              MaterialStateProperty.all(5),
                                        ),
                                        child: const Text("See Detail"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Today Product",
                  style: kTextFieldStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: FutureBuilder(
                    future: todayProductModel,
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
                        if (snapshot.data!.data.isEmpty) {
                          return const Center(
                            child: Text('Data is empty'),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              TodayProduct todayProduct =
                                  snapshot.data!.data[index];
                              String newImageUrl = todayProduct.image == ''
                                  ? urlImage
                                  : todayProduct.image
                                      .replaceAll("127.0.0.1", "10.0.2.2");
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 150,
                                  height: 250,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[300],
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.grey[300],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            newImageUrl,
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                            errorBuilder: (BuildContext context,
                                                Object error,
                                                StackTrace? stackTrace) {
                                              return Container(
                                                color: Colors
                                                    .grey, // warna placeholder jika terjadi kesalahan
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.error_outline,
                                                    color: Colors.red,
                                                    size: 48.0,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  todayProduct.name.length > 20
                                                      ? '${todayProduct.name.substring(0, 10)}...'
                                                      : todayProduct.name,
                                                  style:
                                                      kTextFieldStyle.copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "Rp. ${todayProduct.price}",
                                                  style: kTextFieldStyle,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "Stock: ${todayProduct.quantity}",
                                                  style: kTextFieldStyle,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                98, 102, 206, 244),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                          minimumSize:
                                              MaterialStateProperty.all(
                                            const Size(
                                              100,
                                              25,
                                            ),
                                          ),
                                          elevation:
                                              MaterialStateProperty.all(5),
                                        ),
                                        child: const Text("See Detail"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
