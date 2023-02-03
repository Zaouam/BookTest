import 'package:bibliotheque/app/main/controllers/books_controller.dart';
import 'package:bibliotheque/app/main/controllers/home_controller.dart';
import 'package:bibliotheque/app/main/screens/books_screen.dart';
import 'package:bibliotheque/app/main/screens/shopping_cart_screen.dart';
import 'package:bibliotheque/config/colors/colors.dart';
import 'package:bibliotheque/config/images/app_images.dart';
import 'package:bibliotheque/widgets/book_widget.dart';
import 'package:bibliotheque/widgets/custom_input.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_icon_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return(
        GetBuilder<HomeController>(
          builder: (_) => GestureDetector(
            onTap: () => {FocusScope.of(context).unfocus()},
            child: Scaffold(
              bottomNavigationBar: SizedBox(
                height: 70,
                child: BottomNavigationBar(
                  backgroundColor: AppColors.primaryColor,
                  onTap: (index) {
                    _controller.setPage(index);
                  },
                  currentIndex: _controller.page,
                  unselectedItemColor: AppColors.whiteColor,
                  items:const  [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.list,
                          size: 30,
                          color: AppColors.whiteColor,
                        ),
                        label: 'Books'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 25,
                          color: AppColors.whiteColor,
                        ),
                        label: 'Cart'
                    ),
                  ],
                ),
              ),
                body: Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: _controller.page == 0 ? BooksScreen() : ShoppingCartScreen(),
                )
            ),
          ),
        )
    );
  }
}




