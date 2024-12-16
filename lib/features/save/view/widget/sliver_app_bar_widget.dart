
import 'package:base_project/core/utils/app_assets.dart';
import 'package:base_project/features/home/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.bookmarkicon,
            height: 26,
          ),
          SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              height: 126,
              width: 104,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
