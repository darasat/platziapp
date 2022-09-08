import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platziapp/models/listcomponent.dart';
import 'package:platziapp/models/listmodel.dart';
import 'package:platziapp/ui/petdetail/petdetail.dart';
import 'package:platziapp/values/custom_colors.dart';
import 'package:platziapp/futures/api.dart';
import 'package:platziapp/models/products.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class PetList extends StatefulWidget {
  const PetList({Key? key}) : super(key: key);

  @override
  _PetListState createState() => _PetListState();
}

List<ImageModel> listImages = [
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
  ImageModel(
    title: 'Havanese Dog',
    age: "1 Years Old - Boys",
    price: "\$475",
    url: "assets/dog1.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Australian Dog',
    age: "1 Years Old - Boys",
    price: "\$350",
    url: "assets/dog2.jpeg",
    ratingt: "5.0",
    rating: 5,
  ),
  ImageModel(
    title: 'Havanese Cat',
    age: "1 Years Old - Boys",
    price: "\$235",
    url: "assets/cat1.jpeg",
    ratingt: "4.0",
    rating: 4,
  ),
];

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: InkWell(
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorsList.textcolor,
              size: 27,
            ),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
        ),
        title: Center(
          child: Text(
            "Newest Products",
            style: GoogleFonts.lato(
                color: ColorsList.textcolor,
                fontSize: 24,
                fontWeight: FontWeight.w900),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: ColorsList.textcolor,
              size: 32,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1.0),
                ),
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.only(left: 10, top: 13),
                hintText: "Search your favourite product...",
                hintStyle: const TextStyle(fontSize: 16, color: Colors.black45),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.2,
                    maxHeight: 50),
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder(
              future: getProductsUsingRestAPI(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  List<Products> products = snapshot.data as List<Products>;
                  // print (data);
                  print("la cantidad es" + products.length.toString());

                  return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: ListComponent(
                                  title: products[index].title.toString(),
                                  description: products[index]
                                      .description
                                      .toString()
                                      .substring(0, 15),
                                  price: products[index].price.toString(),
                                  url: products[index].images![0],
                                  ratingt: "5",
                                  rating: 5,
                                  key: UniqueKey(),
                                ),
                                onTap: () {
                                  Get.to(
                                    () => PetDetail(
                                      title: products[index].title.toString(),
                                      // age: listImages[index].age,
                                      // price: listImages[index].price,
                                      // url: listImages[index].url,
                                      // ratingt: listImages[index].ratingt,
                                      // rating: listImages[index].rating,
                                      key: UniqueKey(),
                                    ),
                                  );
                                },
                              ),
                            );
                          }));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
