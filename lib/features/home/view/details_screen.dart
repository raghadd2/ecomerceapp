import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_assets.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/theme/app_colors.dart';
import 'package:base_project/features/home/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart'; // Import the carousel_slider package

class DetailsScreen extends StatefulWidget {
  final Product product;

  DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? _selectedSize = 'Size';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppIcons.bookmarkicon),
            onPressed: () {
              context.push(
                Routes.saveRoute,
                extra: Product(
                  image: widget.product.image,
                  title: widget.product.title,
                  price: widget.product.price,
                  category: widget.product.category,
                ),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset(AppIcons.dotsicon),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DetailesCarouselWidget(widget: widget),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  BrandimageWidget(),
                ],
              ),
              Text(
                widget.product.price,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DeatilscontWidget(
                    color: Color(0xffE7E7E8),
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.circle, color: Color(0xffA5C7F9)),
                        SizedBox(width: 10),
                        Text(
                          'Blue',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xffB7B7B8)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  DeatilscontWidget(
                    color: Colors.white,
                    widget: GestureDetector(
                      onTap: () {
                        _showSizeBottomSheet(context);
                      },
                      child: Text(
                        _selectedSize!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                'These are the Mom Jeans you\'ve been looking for...',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: 3,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomExpansionTileWidget(
                    index: 0,
                    title: 'Shipping and return policies',
                    content:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                  );
                },
              ),
              Divider(color: Colors.grey, thickness: 0.5),
              Padding(
                padding: EdgeInsets.all(16),
                child: ClothesScrollWidget(
                  fontWeight: FontWeight.w500,
                  widgetheight: 300,
                  height: 190,
                  width: 160,
                  text: 'Bershka Monochromatic Coat',
                  text2: '\$50',
                  widget: Text(
                    'Complete your outfit',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  imageurl:
                      'https://s3-alpha-sig.figma.com/img/0a01/e9f0/1491583f72510d23ac288b69680ee562?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TmCwIa0SkmyFLsoskl580CEBh88zIl2LomQ62nvxZqLEMO6QGUjycma4VZvO-LIvxYDdTKIoo~YQj45TTtUpVfzUKqCK2Wo1h~IQnSU1vEuAgRWsifJH0UOqRyUstKNPHOpdWwhxeutmtkkXmEtVq8DEsTpMLi0vUh-KlVQR778tvaMjf3gnsUFH8qWBjO5869G4BtOeS8sHhoptT37Iqt2LBXTXIpufslASRpsgFP40DEhhviHwGiqmePMdxgLmhBtpLWxZD8hPTgqRnnn7aoHE0OOyjBUF8kmNVyN3RSP4ibxnBfwRPhFEeijQiB-0ojvFiNm9TJysp8qfVquiWA__',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavWidget(
        text: 'Add to cart',
      ),
    );
  }

  void _showSizeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Choose Size',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildSizeButton(context, '26', 'S'),
                  _buildSizeButton(context, '28', 'M'),
                  _buildSizeButton(context, '30', 'L'),
                  _buildSizeButton(context, '32', 'XL'),
                  _buildSizeButton(context, '34', 'XXL'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSizeButton(BuildContext context, String size, String label) {
    bool isSelected = _selectedSize == '$size ($label)';

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        setState(() {
          _selectedSize = '$size ($label)';
        });
        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(78, 96, 79, 224) : Colors.white,
          border: Border.all(
            color: isSelected
                ? Color.fromARGB(78, 96, 79, 224)
                : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              size,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Color(0xff614FE0) : Colors.black,
              ),
            ),
            16.wGap,
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Color(0xff614FE0) : Colors.black,
              ),
            ),
            Spacer(),
            if (isSelected)
              Icon(
                Icons.check,
                color: Color(0xff614FE0),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

class BottomNavWidget extends StatelessWidget {
  final String text;
  const BottomNavWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff614FE0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailesCarouselWidget extends StatelessWidget {
  const _DetailesCarouselWidget({
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
                  child: Image.network(
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

class DeatilscontWidget extends StatelessWidget {
  final Widget widget;
  final Color color;

  const DeatilscontWidget({
    super.key,
    required this.widget,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Color(0xffE7E7E8)),
            borderRadius: BorderRadius.circular(10)),
        child: widget,
      ),
    );
  }
}

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
