import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_assets.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/public_methods.dart';
import 'package:base_project/features/home/view/screens/home_screen.dart';
import 'package:base_project/features/home/view/widget/bottom_nav_widget.dart';
import 'package:base_project/features/save/view/widget/sliver_app_bar_widget.dart';
import 'package:base_project/features/save/view/widget/sliver_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SaveItemPageScreen extends StatefulWidget {
  final Product product;

  SaveItemPageScreen({required this.product});

  @override
  State<SaveItemPageScreen> createState() => _SaveItemPageScreenState();
}

class _SaveItemPageScreenState extends State<SaveItemPageScreen> {
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          setState(() {
            _scrollOffset = scrollInfo.metrics.pixels;
          });
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true, // Keeps the AppBar visible when scrolling
              leading: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: SliverAppBarWidget(product: widget.product),
              ),
            ),
            SliverToBoxAdapter(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                color: _scrollOffset > 150 ? Colors.white : Colors.blueGrey[50],
                child: SliverBodyWidget(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavWidget(
        text: "+ Create drawer",
      ),
    );
  }
}
