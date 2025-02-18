import 'package:flutter/material.dart';
import 'package:web_medecin_warehouse/Services/service.dart';
import 'package:web_medecin_warehouse/Widget/sss.dart';

class CreatProduct extends StatefulWidget {
  const CreatProduct({Key? key}) : super(key: key);

  @override
  State<CreatProduct> createState() => _CreatProductState();
}

class _CreatProductState extends State<CreatProduct> {
  int? selectedcompany;
  int? selectedcategory;
  String? scientificName,
      commercialName,
      categoryId,
      quantityAvailable,
      expirationDate,
      price,
      photo,
      description;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("welcome")),
        ),
        body: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        onSaved: (data) {
                          scientificName = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        labelText: 'Scientific_Name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        onSaved: (data) {
                          commercialName = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        labelText: 'Commercial_Name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                              child: FutureBuilder<List>(
                                future: Services().getcompany(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return DropdownButton<int>(
                                        hint: const Text("select company"),
                                        value: selectedcompany,
                                        icon: const Padding(
                                          padding: EdgeInsets.only(left: 20
                                          ),
                                          child: Icon(Icons.menu),
                                        ),
                                        items: List.generate(
                                          snapshot.data!.length,
                                          (i) => DropdownMenuItem(
                                            value: snapshot.data![i]['id'],
                                            child: Text(
                                                "Company : ${snapshot.data![i]['Company_Name']}"),
                                          ),
                                        ),
                                        onChanged: (val) {
                                          setState(() {
                                            selectedcompany = val!;
                                          });
                                        });
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          (selectedcompany != null)
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: FutureBuilder<List>(
                                      future: Services()
                                          .getcategories(x: selectedcompany),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return DropdownButton<int>(
                                              hint:
                                                  const Text('select Category'),
                                              value: selectedcategory,
                                              icon: const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 40),
                                                child: Icon(Icons.menu),
                                              ),
                                              items: List.generate(
                                                snapshot.data!.length,
                                                (i) => DropdownMenuItem(
                                                  value: snapshot.data![i]
                                                      ['id'],
                                                  child: Text(
                                                      "Category : ${snapshot.data![i]['Category_Name']}"),
                                                ),
                                              ),
                                              onChanged: (val) {
                                                setState(() {
                                                  selectedcategory = val!;
                                                });
                                              });
                                        }
                                      }),
                                )
                              : const SizedBox()
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                     
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        onSaved: (data) {
                          quantityAvailable = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        labelText: 'Quantity_Available',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        onSaved: (data) {
                          expirationDate = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        labelText: 'Expiration_Date',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        onSaved: (data) {
                          price = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        labelText: 'Price',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        onSaved: (data) {
                          description = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
                        labelText: 'Description',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await Services().createProduct(
                                scientificName: scientificName!,
                                commercialName: commercialName!,
                                categoryId: selectedcategory!,
                                quantityAvailable: quantityAvailable!,
                                expirationDate: expirationDate!,
                                price: price!,
                                // photo: photo!,
                                description: description!);
                          }
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 70)),
                        child: const Text('Add '),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
