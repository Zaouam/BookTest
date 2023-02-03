import 'package:bibliotheque/app/main/models/book.dart';
import 'package:bibliotheque/app/main/services/books-services.dart';
import 'package:bibliotheque/config/controllerConfig/base_controller.dart';
import 'package:bibliotheque/config/interceptor/interceptor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksController extends BaseController {

  /// VARIABLES
  final TextEditingController searchTextEditingController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final BooksServices _booksServices = BooksServices();
  List<Book> booksList = <Book>[];
  List<Book> searchResult = <Book>[];
  List<Book> booksCartList = <Book>[];
  bool isLoading = true;


  /// GET LIST OF BOOKS IN PAGE INITIALISATION
  @override
  void onInit() {
    getBooks();
    super.onInit();
  }

  /// GET ALL BOOKS
  void getBooks() {
    loadingState();
      DioInterceptor.enableLoader();
    _booksServices.getBooks().then((List<Book>? response) {
      successState();
      if (response != null) {
        fillListBooks(response);
      } else {
        noDataState();
      }
    }).onError((error, stackTrace) {
      errorState();
    });
  }

  /// CLEAR SHOPPING CART
  void clearCart(){
    booksCartList = [];
    update();
  }

  /// SET THE LIST OF BOOKS
  void fillListBooks(List<Book> books) {
    booksList.clear();
    booksList.addAll(books);
    searchResult.addAll(books);
    update();
  }

  /// ADD BOOK TO CART
  void addToCart(Book book) {
    if(!booksCartList.contains(book)){
      booksCartList.add(book);
      Get.snackbar(
          "Succès",
          "Le livre est ajouté dans votre panier",
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: const Duration(milliseconds: 800),
          duration: const Duration(milliseconds: 800)
      );
    }else{
      Get.snackbar(
          "Info",
          "Vous avez deja ajouter ce livre dans votre panier",
          icon: const Icon(Icons.error, color: Colors.white),
          snackPosition: SnackPosition.TOP,
          animationDuration: const Duration(milliseconds: 800),
          duration: const Duration(milliseconds: 800)
      );
    }

    update();
  }

  /// DELETE BOOK FROM CART
  void deleteFromCart(Book book) {
    if(booksCartList.contains(book)){
      booksCartList.remove(book);
      Get.snackbar(
          "Succès",
          "Le livre est supprimé de votre panier",
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: const Duration(milliseconds: 1000),
          duration: const Duration(milliseconds: 1000)
      );

    }
    update();
  }

  /// ADVANCED SEARCH IN LIST OF BOOKS
  void search(String? enteredKeyword) {
    List<Book> results = [];
    if (enteredKeyword!.isEmpty) {
      getBooks();
    } else {
      results = booksList
          .where((book){
            final title = book.title?.toLowerCase();
            final price = book.price.toString();
            final input = enteredKeyword.toLowerCase();
            return title!.contains(input) || price.contains(input);
          }).toList();
      searchResult.clear();
      searchResult.addAll(results);
      update();
    }
  }


}
