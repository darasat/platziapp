/*
 * Copyright 2022 Diego Ramírez
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platziapp/models/products.dart';
import 'package:platziapp/models/categories.dart';

Future<List<Categories?>> getCategoriesUsingRestAPI() async {
  try {
    List<Categories> categoriesList = List<Categories>.empty(growable: true);
    final response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/categories"));

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      categoriesList = await fromCategoriesJson(responseJson);
      return categoriesList;
    } else {
      throw Exception('Failed to load categories');
    }

    //return productList;
  } catch (e) {
    //print(e);
    throw Exception('Failed to load categories');
  }
}

Future<List<Products?>> getProductsUsingRestAPI() async {
  try {
    List<Products> productList = List<Products>.empty(growable: true);
    final response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      productList = await fromProductsJson(responseJson);
      return productList;
    } else {
      throw Exception('Failed to load products');
    }

    //return productList;
  } catch (e) {
    //print(e);
    throw Exception('Failed to load products');
  }
}
