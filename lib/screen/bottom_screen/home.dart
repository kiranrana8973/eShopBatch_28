import 'package:eshopping/repositories/product_repositories.dart';
import 'package:eshopping/response/product_category.dart';
import 'package:flutter/material.dart';
import '../../response/get_product_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl =
      "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2022/opinion/shutterstock1358850531-1642092669.jpg&w=900&height=601";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<ProductResponse?>(
          future: ProductRepository().getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                // ProductResponse productResponse = snapshot.data!;
                List<ProductCategory> lstProductCategory = snapshot.data!.data!;

                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          lstProductCategory[index]
                              .image!
                              .replaceAll('localhost', '10.0.2.2'),
                        ),
                      ),
                      title: Text(lstProductCategory[index].name!),
                      subtitle: Text(snapshot.data!.data![index].description!),
                      trailing: IconButton(
                        icon: const Icon(Icons.shopping_bag),
                        onPressed: () {},
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
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
