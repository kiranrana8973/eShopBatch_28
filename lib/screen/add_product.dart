import 'dart:io';

import 'package:eshopping/repositories/product_repositories.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../repositories/category_repository.dart';

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
    setState(() {
      //  _values = productCategory!.values.toList();
    });
    // if (productCategory != null) {
    //   _selectedItem = _values[0];
    // } else {
    //   _selectedItem = "No data";
    // }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _displayImage(),
                const SizedBox(height: 8),
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
                gap,
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: _values.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                gap,
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    hintText: 'Enter Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                gap,
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product Price',
                    hintText: 'Enter Product Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product Description',
                    hintText: 'Enter Product Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                gap,
                ElevatedButton(
                  onPressed: () {
                    ProductRepository().addProduct(img);
                  },
                  child: const Text('Add Product'),
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
                    ? Image.network(
                        'http://www.clker.com/cliparts/o/G/p/l/g/M/add-student-hi.png',
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
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
