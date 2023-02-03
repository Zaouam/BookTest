import 'package:bibliotheque/app/main/controllers/shopping_cart_controller.dart';
import 'package:bibliotheque/config/controllerConfig/base_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {

  /// VARIABLES
  final ShoppingCartController _shoppingCartController = Get.put(ShoppingCartController());
  int page = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  /// CHANGE CURRENT PAGE ON TAB ITEM CLICK
  void setPage(int index){
    page = index;
    if(index==1){
      _shoppingCartController.getOffers();
    }
    update();
  }
}
