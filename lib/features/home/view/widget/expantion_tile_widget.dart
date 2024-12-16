import 'package:base_project/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  const CustomExpansionTileWidget({
    super.key,
    required this.index,
    required this.title,
    required this.content,
  });
  final int index;
  final String title;
  final String content;

  @override
  State<CustomExpansionTileWidget> createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isOpen = !_isOpen;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.grey, thickness: 0.5),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // 8.wGap,
                Icon(
                  color: AppColors.primaryColor,
                  _isOpen ? Icons.expand_less : Icons.expand_more,
                ),
              ],
            ),
          ),
          if (_isOpen)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(widget.content),
            ),
        ],
      ),
    );
  }
}
