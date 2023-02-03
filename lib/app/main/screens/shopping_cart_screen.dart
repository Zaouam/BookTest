import 'package:bibliotheque/app/main/controllers/books_controller.dart';
import 'package:bibliotheque/app/main/controllers/shopping_cart_controller.dart';
import 'package:bibliotheque/config/colors/colors.dart';
import 'package:bibliotheque/config/images/app_images.dart';
import 'package:bibliotheque/widgets/book_widget.dart';
import 'package:bibliotheque/widgets/custom_input.dart';
import 'package:bibliotheque/widgets/shopping_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_icon_button.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);
  final BooksController _controller = Get.find();
  final ShoppingCartController _shoppingCartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return (
        Scaffold(
        body: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GetBuilder<BooksController>(
                builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Text(
                        'PANIER',
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Container(
                        padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Text(
                          '${_controller.booksCartList.length} ARTICLE',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins'
                          ),
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.black,
                    thickness: 2,
                  ),
                  10.h.verticalSpace,
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:
                      const BouncingScrollPhysics(),
                      itemCount: _controller.booksCartList.length,
                      itemBuilder: (BuildContext context,
                          int index) {
                        GlobalKey key = GlobalKey();
                        final _book = _controller.booksCartList[index];
                        return ShoppingCardWidget(
                          key: key,
                          title: _book.title ?? '',
                          description: _book.synopsis?[0] ?? '',
                          image: _book.cover ?? '',
                          price:  _book.price ?? 0,
                          deletePress: () {
                            _controller.deleteFromCart(_book);
                            _shoppingCartController.getOffers();
                          },
                        );
                      },
                    ),
                  ),
                  10.h.verticalSpace,
                  const Divider(
                    height: 1,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  10.h.verticalSpace,
                  GetBuilder<ShoppingCartController>(
                      builder: (_) => SizedBox(
                      height: 120,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                             const Text(
                               'Prix total :',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Poppins'
                              ),
                            ),
                            Text(
                              '${_shoppingCartController.totalPrice} €',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        10.h.verticalSpace,
                        const Divider(
                          height: 1,
                          color: Colors.black,
                          thickness: 1,
                        ),
                        20.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            InkWell(
                               child: const Text(
                                 'Annuler',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontFamily: 'Poppins'
                                ),
                              ),
                               onTap: (){
                                 _controller.clearCart();
                                 _shoppingCartController.resetPrice();
                               },
                             ),
                            Container(
                              padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.primaryColor,
                              ),
                              child: const Text(
                                'Passer la commande',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Poppins'
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                  )
                ],
              ),
            ),
            ),
        ),
      )
    );
  }
}




