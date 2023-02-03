import 'package:bibliotheque/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingCardWidget extends StatefulWidget {
  const ShoppingCardWidget({
    Key? key,
    required this.image,
    required this.description,
    required this.title,
    required this.price,
    required this.deletePress,
  }) : super(key: key);
  final String? image;
  final String? description;
  final String? title;
  final double? price;
  final Function()? deletePress;

  @override
  _SoppingCardWidgetState createState() => _SoppingCardWidgetState();
}

class _SoppingCardWidgetState extends State<ShoppingCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16.h,
      ),
      child: Stack(
        children: [
          Container(
            height: 170.h,
            decoration: BoxDecoration(
                color:Colors.white,
              border: Border.all(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                0.31.sw.horizontalSpace,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            widget.title ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 16.sp,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          widget.description ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 13.sp,
                              height: 1.5,
                              fontFamily: 'Poppins'
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  spacing: 2,
                                  children: [
                                    Text(
                                      widget.price.toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp
                                      ),
                                    ),
                                    Text(
                                      '€',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width:70.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFF0F1643),
                                            ),
                                            color: AppColors.transparentColor,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                              vertical: 2.h,
                                            ),
                                            child: Text(
                                              '-',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text('9',style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'Poppins',
                                      ),),
                                      InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFF0F1643),
                                            ),
                                            color: AppColors.transparentColor,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                              vertical: 2.w,
                                            ),
                                            child: Text(
                                              '+',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image(
              image: NetworkImage(
                widget.image ?? '',
              ),
              width: 0.31.sw,
              fit: BoxFit.cover,
              height: 170.h,
            ),
          ),

          Positioned(
            child: IconButton(
              onPressed: widget.deletePress,
              icon: const Icon(Icons.delete,color: Colors.red,),
            ),
            top: -5,
            right: -5,
          ),
        ],
      )
    );
  }
}
