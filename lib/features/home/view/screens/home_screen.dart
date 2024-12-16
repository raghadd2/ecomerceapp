import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/features/home/view/widget/product_dialog.dart';
import 'package:base_project/features/home/view/widget/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Feed',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        ),
        body: ProductStaggeredGrid());
  }
}

class ProductStaggeredGrid extends StatefulWidget {
  @override
  _ProductStaggeredGridState createState() => _ProductStaggeredGridState();
}

class _ProductStaggeredGridState extends State<ProductStaggeredGrid> {
  String selectedCategory = 'All';

  final List<Product> products = [
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/5b43/7074/0754ac6c52a999ee06acf072c1ac6562?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Y2TEL9eKSRZdKxkg0m2VgrAiAAHVl9RVoav0XM3ICdVY7nc1gaVUIFwsXpdGyuOcE3sdZ1wtueu3f3xe-gd4HUa7cM8DNt9rg8EIgobuCn8ZuiJNZ9S4cAkrcm~u1YwFhag5J2uoSgdjX7iCXmMn2tr-ac2J5N5V5pUIutUwq1hVvKvkwfzpK8hvZZyVIzRmBSt9R-nkDpsIsDdAoJlPGGNmdKBw03D6KTvp9qSTDFa5onrEWTSLZV1VpP73YyvHB1fdA1BDLzJ0PZje0h2Z-sCmoYp4OL6BxMzipF5eTGYaIXdWYRhf4FUpU1A88BicrH2fugggCAYxn9oUYL1B0Q__',
      title: 'Bershka Mom Jeans',
      price: '\$34',
      category: 'Bershka',
    ),
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/4028/5cfc/bf6623e22d84273dba5255aed5ef0e7a?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=c5Sv5PjaI0YEgLO8zrF~6qix~LahzqLBYqP-FxNRiAijyYmf2B9OO-jU-LbYjZbfizyQvz9xcyddDRYWYWbLtg9lrW7d0xAKt3EPyP~9bV3pAt0IxaAYHdG-Uc5QpvNE16IroQW-lVFBBNhDxsgSQ0cA8fCuicC56u~CmY5p3q8lk44IbUrN93eQ6lVyNhrMpTWZdaend~5GaVgDpFlhyxgQKKMfHMsRLhWyyHrKQVDRuGTR65hAxbPgmWP2rieNpZkjimZvPok0PvLYh6W29Cy-gtsUOP89B5ad-znWo3B0Fz23p3~nyWShk8AWZ1PGlcvusccyU6RGDjVMahQ5kg__',
      title: 'Lacoste x Polaroid',
      price: '\$55',
      category: 'Lacoste',
    ),
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/18b5/2789/963de3fe8ee26d9f500feb862378e5b0?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=blwSaHLVTts8PnmEFyGZMHXClTxJNBjIycKlErCHMDyxGahxOuAx2AXXrmjZFAvuoeG2FxmU3wsQiPwOYIArSEPDDab6qJlVnF-IyBDzMk253QLD8cbPJImfGr3dOfaSqAy8VPoNWcaCViVnepxQQrmAvrHm-i4paCXJllZSCSRhB~trgUXL8QKxM6Eki6zcRxDNV6FLPj886uKoP4iEIGfjojqzKWCIx8xjBl-lDKLtTz8btVl-CYLNsag1ZSue80hISVmURLHTofZsjStsLZIMAsTUjw6a9RmhLMbuO4I9OcFgKCIIkz3PMaBKM2Ciyqb~V~E3TmNWaupsWJ2wyw__',
      title: 'Adidas Sport Tights',
      price: '\$10',
      category: 'Adidas',
    ),
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/661d/1ed6/227f1ea557c5dcde1174eaa831cf2e8d?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hhbfXki1T2BUVCM3nzfnxIqwV46NedHSgAf-RsGfhPjWx6XajlnuOMqrXT~SRKHCT-TmpmH5yOcPVEiZ5KlQuBaNuB8eh1lpxji9ibiv-TN4cDfI6VafN4erP8WQDwrC44EPFJ9UINoyBgx3IPbhLOvWKS6Vpp1t~cv-pBnHaTONXe7TGmfLw2YtAZa7iEmUCSG0nwfOc~AOyaCwtisQeLzwOAz9xSahgOz~4kqQfxjjGiZGEa7wIuogWE0Egsruy8frWwCm2UNCfuWBeC9gKc7BDU8J8m52EWbo1jw04w55NIbZSxtciWn5jISV-p3w1-0oB8KwSL3deSP0vK66Hw__',
      title: 'Bershka Mom Jeans',
      price: '\$30',
      category: 'Bershka',
    ),
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/1718/6570/c8487d98bbba6afb601c9f3764327e29?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j2v8WIna5oCClXOrdJsQK-Bqe-hsIZqjaTMW29FrkGCwj7zo16wJ4VmxUWC1Fm3-r9fh0uj-BPM9fDQzPCtC8fXyIV3vpvqbzYZINaSzdZH4BqN1aLtjlsnbphOwi9iRU7k1rXAKvP~hSsfEQS~pE4vqkAhDnHry1tmpGbkV2dckTR4KywTivnKNYHjDWprCnU-8N14a~6LunAZUaPz~gV~MedeCgQBgbcuYvJj5wFCTXgS-3ZbYda8h1dRKpVfga-vvlktl3vdzUHq6niMVhQG7TFM7foQQi-pFexUE9dLMSQQRYG5KINJXspO3fSgw0GFiDqa7rBpwgLyQRqg40Q__',
      title: 'Adidas Sport Tights',
      price: '\$50',
      category: 'Adidas',
    ),
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/5548/60a2/9f1f90e68cb2a3547c1cabc038cf3891?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EkgQyZDFYfEq3n~pP~TXNltB03JvaG6QY9NGGGE66o1Tz1f-zQqyoNHg-Da59zc0Ti2q39rDz9udnDkE7NAi4IHz8aqVPD7GuFBqB4cvGk6I6JnYtUYFPuakeIoRW49l5mxFwlcEx3sDktMA4Cd92FEwYUBNIPqeM3UPYOPFTEDsNgJBrefCjUVpj5lo0I475dEgx-jLFQITuquHA3O36V0DYrjz0NJaHKBI3sPeWLl6pQkxIOMmTDqKJ5UySe1omevKbhXnl~As~HsAshMTUu5-dzmbkfqQduqLdS3vnZ3T3J68J-uIjTWASUu~fbVT0OPoyBTsBkP4dbKRmXF8ng__',
      title: 'Adidas Sport Tights',
      price: '\$49',
      category: 'Adidas',
    ),
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/9d08/55ce/d79024fdbbfa7513b3b71826da39e31d?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fTh7mT6jQoX4Fmj1TO8sWGTvPLtW-o6HxHDhQQXKJvkmFSxobRGtd3HnpdyaOot1Iqwpex5k4U8~6zV-wol0hL5LpWZS6MEyB4ohPl6pjAOvtGUeD-5AoTKRa8Lg-VCdJp3reGGMsfGZQ1KKObMQGjIG8XHdaCbWkp-h5i3LW2TsdYwisbNAtLUSbFg6EmoDUxyhmIDDwDFnIFr-1sLXEFLWEl9cWy5G6bR0An-LKzP982NiouoIWwxTd3VESW-eqtl6BtvEt5MaPNIDIIFqbLV5jE0MlfNFbsDDpLhxuScjUKTRgYSezgdzsX1Ud2NzOTsaXC817BnycHb9S5IWZA__',
      title: 'Zara Mom Jeans',
      price: '\$22',
      category: 'Zara',
    ),
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/9d08/55ce/d79024fdbbfa7513b3b71826da39e31d?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fTh7mT6jQoX4Fmj1TO8sWGTvPLtW-o6HxHDhQQXKJvkmFSxobRGtd3HnpdyaOot1Iqwpex5k4U8~6zV-wol0hL5LpWZS6MEyB4ohPl6pjAOvtGUeD-5AoTKRa8Lg-VCdJp3reGGMsfGZQ1KKObMQGjIG8XHdaCbWkp-h5i3LW2TsdYwisbNAtLUSbFg6EmoDUxyhmIDDwDFnIFr-1sLXEFLWEl9cWy5G6bR0An-LKzP982NiouoIWwxTd3VESW-eqtl6BtvEt5MaPNIDIIFqbLV5jE0MlfNFbsDDpLhxuScjUKTRgYSezgdzsX1Ud2NzOTsaXC817BnycHb9S5IWZA__',
      title: 'Adidas Sport Tights',
      price: '\$49',
      category: 'Adidas',
    ),
    Product(
      image:
          'https://s3-alpha-sig.figma.com/img/9d08/55ce/d79024fdbbfa7513b3b71826da39e31d?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fTh7mT6jQoX4Fmj1TO8sWGTvPLtW-o6HxHDhQQXKJvkmFSxobRGtd3HnpdyaOot1Iqwpex5k4U8~6zV-wol0hL5LpWZS6MEyB4ohPl6pjAOvtGUeD-5AoTKRa8Lg-VCdJp3reGGMsfGZQ1KKObMQGjIG8XHdaCbWkp-h5i3LW2TsdYwisbNAtLUSbFg6EmoDUxyhmIDDwDFnIFr-1sLXEFLWEl9cWy5G6bR0An-LKzP982NiouoIWwxTd3VESW-eqtl6BtvEt5MaPNIDIIFqbLV5jE0MlfNFbsDDpLhxuScjUKTRgYSezgdzsX1Ud2NzOTsaXC817BnycHb9S5IWZA__',
      title: 'Lacoste x Polaroid',
      price: '\$55',
      category: 'Lacoste',
    ),
  ];

  List<String> get categories {
    final allCategories = products.map((e) => e.category).toSet();
    return ['All', ...allCategories];
  }

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return products;
    }
    return products
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              children: categories.map((category) {
                return ChoiceChip(
                  disabledColor: Colors.transparent,
                  side: BorderSide(color: Colors.transparent),
                  showCheckmark: false,
                  color: WidgetStateProperty.all(selectedCategory == category
                      ? Colors.transparent
                      : Colors.transparent),
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: selectedCategory == category
                        ? Colors.black
                        : Colors.grey,
                  ),
                  label: Text(category),
                  selected: selectedCategory == category,
                  onSelected: (bool isSelected) {
                    setState(() {
                      selectedCategory = isSelected ? category : 'All';
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
        ProductsWidget(
            filteredProducts:
                filteredProducts.map((product) => product.toMap()).toList()),
      ],
    );
  }
}

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.filteredProducts,
  });

  final List<Map<String, dynamic>> filteredProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.count(
        padding: const EdgeInsets.all(16.0),
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 8,
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return GestureDetector(
            onTap: () {
              print('object');
              context.push(
                Routes.deatilsRoute,
                extra: Product(
                  image: product['image'],
                  title: product['title'],
                  price: product['price'],
                  category: product['category'],
                ),
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) => ProductDetailDialog(
                  product: product,
                ),
              );
            },
            child: ProductCard(
              image: product['image'],
              title: product['title'],
              price: product['price'],
              isSquare: index % 3 == 0,
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool isSquare;

  const ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.isSquare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: isSquare ? 200 : 160,
              placeholder: (context, url) => Shimmer_widget(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String image;
  final String title;
  final String price;
  final String category;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.category,
  });

  // Factory constructor for deserialization
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      image: map['image'],
      title: map['title'],
      price: map['price'],
      category: map['category'],
    );
  }

  // Serialization method (optional, for sending data)
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'price': price,
      'category': category,
    };
  }
}
