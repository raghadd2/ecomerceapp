
import 'package:base_project/features/home/view/screens/details_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailesCarouselWidget extends StatelessWidget {
  const DetailesCarouselWidget({
    super.key,
    required this.widget,
  });

  final DetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          autoPlay: false,
        ),
        items: [
          widget.product.image,
          widget.product.image,
          widget.product.image,
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      i,
                      fit: BoxFit.cover,
                    )),
              );
            },
          );
        }).toList());
  }
}
