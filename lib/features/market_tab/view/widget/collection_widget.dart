import 'package:base_project/core/utils/app_extension.dart';
import 'package:flutter/material.dart';

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color: Color(0xffFEEFEF),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          height: 100,
          width: context.width * 0.45,
          child: Text(
            'On sale',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color: Color(0xffEFEDFC),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          height: 100,
          width: context.width * 0.45,
          child: Text(
            'New in',
            style: TextStyle(color: Color(0xff614FE0)),
          ),
        )
      ],
    );
  }
}
