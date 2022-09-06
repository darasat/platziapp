import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platziapp/models/categories.dart';
import 'package:platziapp/models/listcomponent.dart';
import 'package:platziapp/screens/screens_list.dart';
import 'package:platziapp/ui/categories.dart';
import 'package:platziapp/ui/homescreen/recommended.dart';
import 'package:platziapp/ui/petdetail/petdetail.dart';
import 'package:platziapp/values/image_list.dart';
import 'package:platziapp/values/values.dart';
import 'package:platziapp/futures/api.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          leading: const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Image(
              image: AssetImage(ImageList.profile),
              width: 70,
              height: 70,
            ),
          ),
          title: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
            title: Text(
              "Hello,",
              style: GoogleFonts.lato(color: Colors.black45, fontSize: 16),
            ),
            subtitle: Text(
              Strings.name,
              style: GoogleFonts.lato(
                color: ColorsList.textcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
        body: SingleChildScrollView(
          child: Wrap(
            verticalDirection: VerticalDirection.down,
            children: [
              ListTile(
                title: Card(
                  color: Colors.transparent,
                  elevation: 0.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black38, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black38, width: 1.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.only(left: 10, top: 13),
                      hintText: "Search your favourite product...",
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.black45),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 1.2,
                          maxHeight: 50),
                    ),
                  ),
                ),
                trailing: SizedBox(
                  width: 55,
                  height: 55,
                  child: Card(
                    elevation: 2.0,
                    color: ColorsList.textcolor,
                    child: IconButton(
                      constraints: const BoxConstraints(
                        maxHeight: 50,
                        maxWidth: 50,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.manage_search,
                          size: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Product Category",
                  style: GoogleFonts.lato(
                    color: ColorsList.textcolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: BoxComponent(title: Strings.dog, url: ImageList.dog),
              ),
              BoxComponent(title: Strings.cat, url: ImageList.cat),
              BoxComponent(title: Strings.bird, url: ImageList.bird),
              BoxComponent(title: Strings.rabbit, url: ImageList.rabbit),
              BoxComponent(title: Strings.other, url: ImageList.other),
              Container(
                margin: EdgeInsets.all(5.0),
                height: 330.0,
                width: 370.0,
                child: Column(
                  children: [
                    const SizedBox(width: 10),
                    FutureBuilder(
                        future: getCategoriesUsingRestAPI(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data;
                            List<Categories> categories =
                                snapshot.data as List<Categories>;
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Flexible(
                                      child: Container(
                                          height: 250,
                                          width: 500,
                                          child: ListView.builder(
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: categories.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                child: RecommendedBox(
                                                  ratingt: "5.0",
                                                  title: categories[index]
                                                      .name
                                                      .toString(),
                                                  url: categories[index]
                                                      .image
                                                      .toString(),
                                                  color: Colors.primaries[
                                                      Random().nextInt(Colors
                                                          .primaries.length)],
                                                ),
                                                onTap: () {
                                                  Get.to(
                                                    () => PetDetail(
                                                      title: 'Havanese Dog',
                                                      age: "1 Years Old - Boys",
                                                      price: "\$475",
                                                      url: "assets/dog1.jpeg",
                                                      ratingt: "5.0",
                                                      rating: 5,
                                                      key: UniqueKey(),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          )))
                                ]);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          // By default show a loading spinner.
                          return CircularProgressIndicator();
                        }),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Newest Product",
                  style: GoogleFonts.lato(
                    color: ColorsList.textcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: InkWell(
                  child: const Text("See All"),
                  onTap: () {
                    Get.to(() => Screens.newPetScreen);
                  },
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ListComponent(
                  title: 'Havanese Dog',
                  description: "1 Years Old",
                  price: "\$475",
                  url: "https://placedog.net/500",
                  ratingt: "5.0",
                  rating: 5,
                  key: UniqueKey(),
                ),
                onTap: () {
                  Get.to(
                    () => PetDetail(
                      title: 'Havanese Dog',
                      age: "1 Years Old",
                      price: "\$475",
                      url: "https://placedog.net/500",
                      ratingt: "5.0",
                      rating: 5,
                      key: UniqueKey(),
                    ),
                  );
                },
              ),
              InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ListComponent(
                  title: 'Australian Dog',
                  description: "1 Years Old",
                  price: "\$350",
                  url: "https://placedog.net/500",
                  ratingt: "5.0",
                  rating: 5,
                  key: UniqueKey(),
                ),
                onTap: () {
                  Get.to(
                    () => PetDetail(
                      title: 'Australian Dog',
                      age: "1 Years Old",
                      price: "\$350",
                      url: "https://placedog.net/500",
                      ratingt: "5.0",
                      rating: 5,
                      key: UniqueKey(),
                    ),
                  );
                },
              ),
              InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ListComponent(
                  title: 'Havanese Cat',
                  description: "1 Years Old",
                  price: "\$235",
                  url: "https://placedog.net/500",
                  ratingt: "4.0",
                  rating: 4,
                  key: UniqueKey(),
                ),
                onTap: () {
                  Get.to(
                    () => PetDetail(
                      title: 'Havanese Cat',
                      age: "1 Years Old",
                      price: "\$235",
                      url: "https://placedog.net/500",
                      ratingt: "4.0",
                      rating: 4,
                      key: UniqueKey(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 130),
            ],
          ),
        ));
  }
}
