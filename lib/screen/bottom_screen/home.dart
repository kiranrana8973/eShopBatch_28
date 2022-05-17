import 'package:eshopping/repositories/product_repositories.dart';
import 'package:eshopping/response/get_product_response.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    ProductResponse productResponse = await ProductRepository().getProducts();
    for (var product in productResponse.data!) {
      print(product.name);
    }
    // var length = productResponse.data!.length.toString();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Home screen"),
      ),
    );
  }
}
