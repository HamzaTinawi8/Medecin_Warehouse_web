
import 'package:flutter/material.dart';
import 'package:web_medecin_warehouse/Services/service.dart';
import 'package:web_medecin_warehouse/Widget/card_products.dart';

class AllProductsScreen extends StatefulWidget {
  AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return (FutureBuilder<List<dynamic>>(
        future: Services().getallproducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Center(child: Text("welcome")),
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                ),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: SizedBox(
                        width: 600,
                        child: ListView.builder(
                            itemCount: snapshot.data![0].length,
                            itemBuilder: (context, i) {
                              return CardProducts(
                                photo: '${snapshot.data![0][i]['photo']}',
                                scientific_Name: '${snapshot.data![0][i]['Scientific_Name']}',
                                Category_Name: '${snapshot.data![0][i]['Category_Name']}' ,
                                Company_Name: '${snapshot.data![0][i]['Company_Name']}',
                                Quantity_Available: snapshot.data![0][i]['Quantity_Available'],
                                Price: '${snapshot.data![0][i]['Price']}',
                                id: snapshot.data![0][i]['id'],
                                onDeleted: (){
                                  setState(() {});
                                },
                               
                              );
                            }),
                      ),
                    ))
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        }));
  }
}
