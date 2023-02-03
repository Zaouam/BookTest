import 'package:bibliotheque/app/main/controllers/books_controller.dart';
import 'package:bibliotheque/config/images/app_images.dart';
import 'package:bibliotheque/widgets/book_widget.dart';
import 'package:bibliotheque/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/custom_icon_button.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({Key? key}) : super(key: key);
  final BooksController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return (
        GetBuilder<BooksController>(
      builder: (_) => GestureDetector(
        onTap: () => {FocusScope.of(context).unfocus()},
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomInput(
                        controller: controller.searchTextEditingController,
                        onChanged: (text) {
                          controller.search(text);
                        },
                        suffixIcon: controller.searchTextEditingController.text.isNotEmpty
                            ? CustomIconButton(
                          icon: Image.asset(
                            AppImages.clearIcon,
                          ),
                          onPressed:(){
                            controller.searchTextEditingController.clear();
                            controller.getBooks();
                          },
                        )
                            : null,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ),
                          child: Image(
                            image: const AssetImage(
                              AppImages.searchIcon,
                            ),
                            width: 22.w,
                            height: 22.h,
                          ),
                        ),
                        hintText: 'Chercher par titre ou prix',
                      ),
                    ),
                  ],
                ),
                20.h.verticalSpace,
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics:
                    const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    itemCount: controller.searchResult.length,
                    itemBuilder: (BuildContext context,
                        int index) {
                      GlobalKey key = GlobalKey();
                      final _book = controller.searchResult[index];
                      return BookWidget(
                        key: key,
                        title:_book.title ?? '',
                        description:_book.synopsis?[0] ?? '',
                        image:_book.cover ?? '',
                        price: _book.price ?? 0,
                        onTap: () {
                          controller.addToCart(_book);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    )
    );
  }
}




