import 'package:bibliotheque/app/main/controllers/books_controller.dart';
import 'package:bibliotheque/app/main/controllers/home_controller.dart';
import 'package:bibliotheque/app/main/controllers/shopping_cart_controller.dart';
import 'package:get/instance_manager.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BooksController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ShoppingCartController());
  }
}
