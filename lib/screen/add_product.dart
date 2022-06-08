import 'dart:io';

import 'package:eshopping/model/product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../repositories/category_repository.dart';
import '../repositories/product_repositories.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  Map<String, String>? productCategory = <String, String>{};

  final List<String> _values = [];
  @override
  void initState() {
    super.initState();
    _loadCategory();
  }

  String dropdownValue = "One";

  _loadCategory() async {
    productCategory = await CategoryRepository().getCategory();
  }

  // Load camera and gallery images and store it to the File object.
  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  var gap = const SizedBox(height: 10);

  var nameController = TextEditingController(text: "Apple tv");
  var descriptionController = TextEditingController(text: "Apple tv");
  var priceController = TextEditingController(text: "100");
  var categoryController =
      TextEditingController(text: "6281fdb044d29546f08846d4");
  var countInStockController = TextEditingController(text: "2");
  var ratingController = TextEditingController(text: "3");
  var numReviewsController = TextEditingController(text: "3");
  var isFeaturedController = TextEditingController(text: "false");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _displayImage(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _loadImage(ImageSource.camera);
                        },
                        icon: const Icon(Icons.camera_enhance),
                        label: const Text('Open Camera'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _loadImage(ImageSource.gallery);
                        },
                        icon: const Icon(Icons.browse_gallery_sharp),
                        label: const Text('Open Gallery'),
                      ),
                    ),
                  ],
                ),

                // FutureBuilder(
                //   future: _loadCategory(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return DropdownButton<String>(
                //         value: dropdownValue,
                //         icon: const Icon(Icons.arrow_downward),
                //       );
                // ),
                gap,
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    hintText: 'Enter Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Product Description',
                    hintText: 'Enter Product Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap,
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Product Price',
                    hintText: 'Enter Product Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap,
                TextFormField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Product Category',
                    hintText: 'Select Product Category',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap,
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: countInStockController,
                  decoration: const InputDecoration(
                    labelText: 'Count in Stock',
                    hintText: 'Enter count in stock',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                gap,
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ratingController,
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                    hintText: 'Enter rating',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap,
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: numReviewsController,
                  decoration: const InputDecoration(
                    labelText: 'Num reviews',
                    hintText: 'Enter num reviews',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Product product = Product(
                        name: nameController.text,
                        description: descriptionController.text,
                        price: double.parse(priceController.text),
                        category: categoryController.text,
                        countInStock: int.parse(countInStockController.text),
                        rating: int.parse(ratingController.text),
                        numReviews: int.parse(numReviewsController.text),
                        isFeatured: false,
                      );
                      ProductRepository().addProduct(img, product);
                    },
                    label: const Text('Add Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayImage() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: ClipRRect(
        // For rounded upper right corner and left corner in imageview
        borderRadius: BorderRadius.circular(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: img == null
                    ? SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.network(
                          'http://www.clker.com/cliparts/o/G/p/l/g/M/add-student-hi.png',
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                        ),
                      )
                    : Image.file(img!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//  DropdownButton<String>(
//                   value: dropdownValue,
//                   icon: const Icon(Icons.arrow_downward),
//                   elevation: 16,
//                   style: const TextStyle(color: Colors.deepPurple),
//                   underline: Container(
//                     height: 2,
//                     color: Colors.deepPurpleAccent,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropdownValue = newValue!;
//                     });
//                   },
//                   items: _values.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),