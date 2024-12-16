
import 'dart:ui';

import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_assets.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/home/view/screens/home_screen.dart';
import 'package:base_project/features/home/view/widget/custom_button.dart';
import 'package:base_project/features/home/view/widget/details_button.dart';
import 'package:base_project/features/home/view/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailDialog extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailDialog({required this.product});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              blendMode: BlendMode.colorDodge,
              filter: ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0),
              child: Container(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              // blendMode: BlendMode.,
              filter: ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0),
              child: Container(),
            ),
          ),
          Container(
            width: 300,
            height: 450,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),

                        placeholder: (context, url) => Shimmer_widget(),
                        imageUrl: product['image'],
                        height: 266,
                        // width: 215,
                        width: context.width * 0.57,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomButton(
                            ontap: () {
                              context.push(
                                Routes.saveRoute,
                                extra: Product(
                                  image: product['image'],
                                  title: product['title'],
                                  price: product['price'],
                                  category: product['category'],
                                ),
                              );
                            },
                            icon: AppIcons.bookmarkicon,
                          ),
                          CustomButton(
                            icon: AppIcons.checkicon,
                            ontap: () {},
                          ),
                          CustomButton(
                            icon: AppIcons.shareicon,
                            ontap: () {},
                          ),
                          CustomButton(
                            icon: AppIcons.bandicon,
                            ontap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 70,
                  child: DeatielsButton(product: product),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
