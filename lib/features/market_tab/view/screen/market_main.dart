import 'package:base_project/features/home/view/widget/clothes_scroll_widget.dart';
import 'package:base_project/features/market_tab/view/widget/collection_widget.dart';
import 'package:base_project/features/save/view/screen/save_screen.dart';
import 'package:base_project/features/save/view/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';

class MarketMain extends StatefulWidget {
  @override
  State<MarketMain> createState() => _MarketMainState();
}

class _MarketMainState extends State<MarketMain> {
  final List<Tab> tabs = [
    Tab(text: 'Featured'),
    Tab(text: 'Collection'),
    Tab(text: 'Stores'),
    Tab(text: 'Tags'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverSafeArea(
              sliver: SliverAppBar(
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Market',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        10.hGap,
                        Row(
                          children: [
                            Expanded(
                              child: CustomSearchWidget(
                                text: "Search on Tassel",
                              ),
                            ),
                            10.wGap,
                            InkWell(
                              onTap: () {
                                _showSizeBottomSheet(context);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    Icon(Icons.filter_list, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        TabBar(
                          labelStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          tabAlignment: TabAlignment.start,
                          dividerColor: Colors.transparent,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                          tabs: tabs,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  _buildFeaturedTab(),
                  _buildCollectionTab(),
                  _buildStoresTab(context),
                  _buildTagsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          10.hGap,
          _carousel(),
          Column(
            children: [
              10.hGap,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: InkWell(
                  onTap: () {
                    context.push(Routes.storesRoute);
                  },
                  child: ClothesScrollWidget(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    widgetheight: 210,
                    height: 130,
                    width: 215,
                    text2: "Denim, Casual",
                    text: "Levi’s",
                    imageurl:
                        'https://s3-alpha-sig.figma.com/img/5506/90c8/4505123c7fbec52bece16fdf8a29f04a?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cHMsVznJFyxsF9atE0flQbMl~4mSabNXD5SpyQMQf-AnyztvD1ybYqwMMo0HLJM~whcU47aF7xiRmeGY6NI7DI-AROPcPRBDCaWZEJ4CbsziUBmWZfL8YEaVIeXkLWv~Oyo~wv0HxxmGj93HUcCTSJ8glVJP0PDfJGOVMYtF7xyDuB9mN9CeSHqZv9IPKANfS53s10Edl3T13Pbugiv3fCPY1rbGwHEZEwHhHq8FD1MMigXOuYBFBHz~HkeD9R7-mRXw7UVwsMVD6tRHS8gTuEp7KxVnwghvukg-1x-vt~nncYkpW-gTNyx15N5wdI27iWiW38Czq-AmJP0ijyNuRA__',
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Stores',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(Icons.arrow_forward_rounded),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ClothesScrollWidget(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  widgetheight: 210,
                  height: 130,
                  width: 215,
                  text2: "\$29",
                  text: "Bershka Platform Sandals with Buckle",
                  imageurl:
                      'https://s3-alpha-sig.figma.com/img/5506/90c8/4505123c7fbec52bece16fdf8a29f04a?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cHMsVznJFyxsF9atE0flQbMl~4mSabNXD5SpyQMQf-AnyztvD1ybYqwMMo0HLJM~whcU47aF7xiRmeGY6NI7DI-AROPcPRBDCaWZEJ4CbsziUBmWZfL8YEaVIeXkLWv~Oyo~wv0HxxmGj93HUcCTSJ8glVJP0PDfJGOVMYtF7xyDuB9mN9CeSHqZv9IPKANfS53s10Edl3T13Pbugiv3fCPY1rbGwHEZEwHhHq8FD1MMigXOuYBFBHz~HkeD9R7-mRXw7UVwsMVD6tRHS8gTuEp7KxVnwghvukg-1x-vt~nncYkpW-gTNyx15N5wdI27iWiW38Czq-AmJP0ijyNuRA__',
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Products on sale',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.arrow_forward_rounded),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCollectionTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CollectionWidget(context: context),
          5.hGap,
          CollectionWidget(context: context),
          5.hGap,
          CollectionWidget(context: context),
        ],
      ),
    );
  }

  Widget _buildStoresTab(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {
              context.push(Routes.storesRoute);
            },
            child: ClothesScrollWidget(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              widgetheight: 210,
              height: 130,
              width: 215,
              text2: "Denim, Casual",
              text: "Levi’s",
              imageurl:
                  'https://s3-alpha-sig.figma.com/img/5506/90c8/4505123c7fbec52bece16fdf8a29f04a?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cHMsVznJFyxsF9atE0flQbMl~4mSabNXD5SpyQMQf-AnyztvD1ybYqwMMo0HLJM~whcU47aF7xiRmeGY6NI7DI-AROPcPRBDCaWZEJ4CbsziUBmWZfL8YEaVIeXkLWv~Oyo~wv0HxxmGj93HUcCTSJ8glVJP0PDfJGOVMYtF7xyDuB9mN9CeSHqZv9IPKANfS53s10Edl3T13Pbugiv3fCPY1rbGwHEZEwHhHq8FD1MMigXOuYBFBHz~HkeD9R7-mRXw7UVwsMVD6tRHS8gTuEp7KxVnwghvukg-1x-vt~nncYkpW-gTNyx15N5wdI27iWiW38Czq-AmJP0ijyNuRA__',
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Stores',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(Icons.arrow_forward_rounded),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTagsTab() {
    return Center(
      child: Text(
        "Tags Tab Content",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container _carousel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          viewportFraction: 0.85,
        ),
        items: List.generate(
          5,
          (index) => ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://s3-alpha-sig.figma.com/img/4796/afb2/2e34f91a7e3474a949d5a8401bcf283b?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CuPtPAK4HgDcuWIxpUJjr24tru7MoBTDcugJxmIWucLeWepGMzVXcP4Q7Fb6sYEzc8dufnBC4V1mjre0rE9WI~w2XilmVoO7anmwJeQoqJ8stdK9zVsgSMs-t12~zK8BcrRwPEvogzz0UvZR1oQ6PFXcMYn-lgAQmuBi0fsQPVDDYMoMLl60BSlhOJYSGJEBCOpOHPzETcLO7TkflF1vaCizlYnyJJPLpoKR2UwKvWK1NJj-K7p-kuKhKIQlQtx679ZyAf8btYb1mfCI0ENIvGUytx~CqJqbnOa9HN2SgSG2Zs4Of0LGyi8U711-t4TUZUfsdoxefEeUcJK1D95TNg__',
              fit: BoxFit.cover,
            ),
          ),
        ),
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
                'Select department',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildSizeButton(context, 'Woman'),
                  _buildSizeButton(context, 'Man'),
                  _buildSizeButton(context, 'Girl (0-12 years old)'),
                  _buildSizeButton(context, 'Boy (0-12 years old)'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String? _selectedSize;
  Widget _buildSizeButton(BuildContext context, String label) {
    bool isSelected = _selectedSize == label;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        _selectedSize = label;
        Navigator.of(context).pop();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffEFEDFC) : Colors.white,
          border: Border.all(
            color: isSelected ? Color(0xffEFEDFC) : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            isSelected
                ? SizedBox()
                : Icon(
                    Icons.circle_outlined,
                    color: Colors.black54,
                    size: 20,
                  ),
            if (isSelected)
              Icon(
                Icons.circle,
                color: Color(0xff614FE0),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
