import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platziapp/ui/account/account.dart';
import 'package:platziapp/ui/cart/cart.dart';
import 'package:platziapp/ui/homescreen/homescreen.dart';
import 'package:platziapp/ui/petlist/petlist.dart';
import 'package:platziapp/ui/splash/splash_screen.dart';

class Screens {
  static const splash = Splash(key: Key("Splash"));
  static const home = HomeScreen(key: Key("Home"));
  static const newPetScreen = PetList(key: Key("Pet"));
  static const cartScreen = CartScreen(key: Key("Cart"));
  static const account = Account(key: Key("Account"));
}
