import 'package:eshopping/repositories/product_repositories.dart';
import 'package:eshopping/response/product_category.dart';
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
    // _loadData();
  }

  _loadData() async {
    var a = await ProductRepository().getProducts();
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _loadData(),
          builder: (context, AsyncSnapshot snapshot) {
            var state = snapshot.connectionState;
            if (state == ConnectionState.done) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                List<ProductCategory> lstProductCategory = [];
                // extract data from data
                lstProductCategory = data.data;

                return ListView.builder(
                  itemCount: lstProductCategory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(lstProductCategory[index].name!),
                      subtitle: Text(lstProductCategory[index].description!),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            } else if (state == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget displayProducts(ProductCategory productCategory) {
    return Card(
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              productCategory.image!,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
