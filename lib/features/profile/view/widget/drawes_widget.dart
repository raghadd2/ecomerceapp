import 'package:base_project/features/home/view/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DrawersWidget extends StatelessWidget {
  final String title;
  final String image;
  const DrawersWidget({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text('27 products',
                  style: TextStyle(
                    color: Colors.grey,
                  )),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),

                        placeholder: (context, url) => Shimmer_widget(),height: 104,imageUrl:  image),
          )
        ],
      ),
    );
  }
}
