import 'package:bibliotheque/app/main/controllers/books_controller.dart';
import 'package:bibliotheque/app/main/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../app/main/controllers/shopping_cart_controller.dart';

class BooksScreenBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => BooksController());
  }
}

class ShoppingCartScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShoppingCartController());
  }
}

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}