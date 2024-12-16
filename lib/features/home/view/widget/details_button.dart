
import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/home/view/screens/home_screen.dart';
import 'package:base_project/features/home/view/widget/brand_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class DeatielsButton extends StatefulWidget {
  const DeatielsButton({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  State<DeatielsButton> createState() => _DeatielsButtonState();
}

class _DeatielsButtonState extends State<DeatielsButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('object');
        context.push(
          Routes.deatilsRoute,
          extra: Product(
            image: widget.product['image'],
            title: widget.product['title'],
            price: widget.product['price'],
            category: widget.product['category'],
          ),
        );
      },
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Container(
        width: context.width * 0.7,
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _isPressed ? Color(0xff614FE0) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.product['title'],
              style: TextStyle(
                fontSize: 16,
                color: _isPressed ? Colors.white : Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            BrandimageWidget(),
          ],
        ),
      ),
    );
  }
}
