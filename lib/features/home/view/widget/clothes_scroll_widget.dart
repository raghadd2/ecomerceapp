
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/home/view/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClothesScrollWidget extends StatelessWidget {
  final Widget widget;
  final String imageurl;
  final String text;
  final String text2;
  final double height;
  final double width;
  final double widgetheight;
  final FontWeight fontWeight;
   Color? color;

   ClothesScrollWidget({
    super.key,
    required this.widget,
    required this.imageurl,
    required this.text,
    required this.text2,
    required this.height,
    required this.width,
    required this.widgetheight,
    required this.fontWeight,  this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget,
        20.hGap,
        Container(
          height: widgetheight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => 10.wGap,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),

                        placeholder: (context, url) => Shimmer_widget(),
                  imageUrl:
                    imageurl,
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
                10.hGap,
                Container(
                  width: context.width * 0.4,
                  child: Text(
                    text,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontSize: 14,
                    color:color ,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
