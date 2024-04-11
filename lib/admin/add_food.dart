import 'dart:io';
import 'package:eat_more/services/database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> foodItems = ['Burger', 'Pizza'];
  String? value;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  bool _isLoading = false;

  Future getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(image!.path);
    });
  }

  Future<void> uploadItem() async {
    setState(() {
      bool _isLoading = true;
    });
    if (selectedImage != null &&
        nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        detailController.text.isNotEmpty &&
        value != null) {
      try {
        final addId = randomAlphaNumeric(10);
        final Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child("blogImages").child(addId);
        final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
        final TaskSnapshot snapshot = await task;

        final downloadUrl = await snapshot.ref.getDownloadURL();

        final Map<String, dynamic> addItem = {
          "Image": downloadUrl,
          "Name": nameController.text,
          "Price": priceController.text,
          "Detail": detailController.text
        };

        await DatabaseMethods().addFoodItem(addItem, value!).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                "Food Item has been added Successfully",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          );
        });
      } catch (e) {
        print("Error uploading item: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Failed to add Food Item. Please try again.",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Please fill in all fields and select a category.",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Add Item",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              selectedImage == null
                  ? GestureDetector(
                      onTap: getImage,
                      child: Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.camera_alt_outlined,
                              color: Colors.black),
                        ),
                      ),
                    )
                  : Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(selectedImage!, fit: BoxFit.cover),
                        ),
                      ),
                    ),
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  "Upload the Item Picture",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Item Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: "Item Price",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: detailController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: "Item Detail",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                items: foodItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Select Category",
                  border: OutlineInputBorder(),
                ),
                value: value,
              ),
              const SizedBox(height: 50.0),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await uploadItem();
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      width: double
                          .infinity, // This will make the button full width
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : const Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
