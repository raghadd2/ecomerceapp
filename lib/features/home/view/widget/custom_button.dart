
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  final String icon;
  final Function ontap;
  const CustomButton({
    required this.icon,
    Key? key,
    required this.ontap,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.ontap();
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
            height: _isPressed ? 60 : 50,
            width: _isPressed ? 60 : 50,
            decoration: BoxDecoration(
              color: _isPressed ? Color(0xff614FE0) : Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Container(
              child: SvgPicture.asset(
                widget.icon,
                fit: BoxFit.scaleDown,
                colorFilter: _isPressed
                    ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                    : null,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
