import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platziapp/common_widgets/rating.dart';
import 'package:platziapp/values/custom_colors.dart';

// ignore: must_be_immutable
class ListComponent extends StatelessWidget {
  String title = "abc";
  String age = "abc";
  String price = "\$200";
  String ratingt = "5";
  int rating = 5;
  String url = "abc";

  ListComponent({
    Key? key,
    required this.title,
    required this.age,
    required this.price,
    required this.rating,
    required this.ratingt,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 10.0, right: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Center(
          child: ListTile(
            leading: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.28,
                  maxHeight: MediaQuery.of(context).size.width * 0.28,
                ),
                child: Image.network(url, fit: BoxFit.fill)),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    color: ColorsList.textcolor,
                  ),
                ),
                Text(
                  age,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      ratingt,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: IconTheme(
                        data: IconThemeData(
                          color: Colors.yellow[600],
                          size: 20,
                        ),
                        child: StarDisplay(value: rating),
                      ),
                    ),
                  ],
                )
              ],
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
