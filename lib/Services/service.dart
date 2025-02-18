import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  Future<dynamic> getallorder() async {
    var url = "http://127.0.0.1:8000/api/orders";
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      //   "Authorization":
      //       "Bearer 3|IGJovYztrUnj1KW20wwuZ8ou0cHycZAyNZiZr9iSea0583ab"
    });
    dynamic responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<List<dynamic>> getallproducts() async {
    var url = "http://127.0.0.1:8000/api/Products";
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
    });
    List responseBody = jsonDecode(response.body);

    print(responseBody);
    return responseBody;
  }

  Future<dynamic> deleteproduct({required x}) async {
    var url = "http://127.0.0.1:8000/api/Product/$x";
    http.Response response = await http.delete(Uri.parse(url), headers: {
      "Accept": "application/json",
    });
    dynamic responseBody = jsonDecode(response.body);

    return responseBody;
  }

  Future<List> getcompany() async {
    var url = "http://127.0.0.1:8000/api/company";
    http.Response response = await http.get(Uri.parse(url));
    List responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<List> getcategories({required x}) async {
    var url = "http://127.0.0.1:8000/api/dashboard/company/$x";
    http.Response response = await http.get(
      Uri.parse(url),
    );
    print(response.body);
    List responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<dynamic> createProduct({
    required String scientificName,
    required String commercialName,
    required int categoryId,
    required String quantityAvailable,
    required String expirationDate,
    required String price,
    // required String photo,
    required String description,
  }) async { http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:8000/api/Product"),
      body: {
        "Scientific_Name": scientificName,
        "Commercial_Name": commercialName,
        "Category_id": "$categoryId",
        "Quantity_Available": quantityAvailable,
        "Expiration_Date": expirationDate,
        "Price": price,
        // "photo": photo,
        "description": description
      },
      headers: {
        "Accept": "application/json",
      },
    );

    dynamic responseBody = jsonDecode(response.body);
    return responseBody;
  }



   Future<dynamic> changestatus({
    required int id,
    required String x,
  }) async { http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:8000/api/order/${id}"),
      body: {
        "Status" : "$x"
      },
      headers: {
        "Accept": "application/json",
      },
    );

    dynamic responseBody = jsonDecode(response.body);
    return responseBody;
  }



}
