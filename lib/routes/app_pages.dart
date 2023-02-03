import 'package:bibliotheque/app/main/screens/books_screen.dart';
import 'package:bibliotheque/app/main/screens/shopping_cart_screen.dart';
import 'package:bibliotheque/routes/app_bindings.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppRoutes.books,
      page: () => BooksScreen(),
      binding: BooksScreenBindings(),
    ),
    GetPage(
      name: AppRoutes.shoppingCart,
      page: () => ShoppingCartScreen(),
      binding: ShoppingCartScreenBindings(),
    ),
    GetPage(
      name: AppRoutes.shoppingCart,
      page: () => ShoppingCartScreen(),
      binding: ShoppingCartScreenBindings(),
    ),
  ];
}
