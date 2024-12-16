import 'package:base_project/core/utils/app_assets.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/home/view/widget/shimmer_widget.dart';
import 'package:base_project/features/profile/view/widget/drawes_widget.dart';
import 'package:base_project/features/save/view/widget/search_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context, url) => Shimmer_widget(),
                        imageUrl:
                            // errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                            "https://www.w3schools.com/w3images/avatar2.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    10.wGap,
                    Icon(Icons.settings_outlined, size: 25),
                  ],
                ),
                Text(
                  'Drawers',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                20.hGap,
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchWidget(
                        text: "Filter drawers",
                      ),
                    ),
                    10.wGap,
                    InkWell(
                      onTap: () {
                        _filterBottomSheet(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.filtericon,
                          // color: Colors.black,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    10.wGap,
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                20.hGap,
                DrawersWidget(
                  image:
                      'https://s3-alpha-sig.figma.com/img/661d/1ed6/227f1ea557c5dcde1174eaa831cf2e8d?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=eTBSEa5fxmnBVi8vbxFj2Dbh~6YVCx0fzwUS1ioaP~pRAKG8eYmnjtaLq~7EUnHw3YLeNrqmHFtGK53xouW31y1Kj1Y9opIIIm90QsTIVAa8vA8QIKcH2PM317C5qUaV90K5RyTkHjjMacXVetM-BF71pruh7R4GKTKtHo4DFcepStU2~2oCZ7P-eP7yONUXRY~~aHcEGSV54ajnjjXW6S13zN4u5ObxMhOt353o2eOGHsivjhzlGGekMVBCYHhFOl4yEC~LlQFfFq~2CBNIw39ZM4xrJUR61UW1VvzV8P4sAEQanGDPKxk94KWVd~Hao3pEpdEsr7VxRE-YDzJ4JQ__',
                  title: 'Summer Outfit',
                ),
                15.hGap,
                DrawersWidget(
                  image:
                      'https://s3-alpha-sig.figma.com/img/26b3/7e99/84178826fa4b929b3e153b3725c4256c?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=U0MKEXRziOszVJAAvOib56g7Y4CSoiBBXF1SWe2Eny06F0dTbwVXH5nIildW-TCeg60NUL86fJSvtBAbA8Vx0t9tlv8ZI90Bd8wjildfVhVCNLziW1X7eLaP3q4XiyXmmjmknkgHv0z-9O7e6mq3N7Xv6ZdX0Ec~Um8a5hy-SF67OwY9eyVk-CGYGjcGdK6qQ883wBzJdwzBFrFIX8jk1m5qXRsy2ZjlC2YFvug5Srpe-WZqlGcxS4loWE9wOmMZQVk7-AJp0coJXcVQYze5ziQrt7o340lPh2YE2osSI1wWn8t~-vY2L0Zm0F7repV3B6gStEFPPXqZYxw23hbvgw__',
                  title: 'Vacations',
                ),
                15.hGap,
                DrawersWidget(
                  image:
                      'https://s3-alpha-sig.figma.com/img/661d/1ed6/227f1ea557c5dcde1174eaa831cf2e8d?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=eTBSEa5fxmnBVi8vbxFj2Dbh~6YVCx0fzwUS1ioaP~pRAKG8eYmnjtaLq~7EUnHw3YLeNrqmHFtGK53xouW31y1Kj1Y9opIIIm90QsTIVAa8vA8QIKcH2PM317C5qUaV90K5RyTkHjjMacXVetM-BF71pruh7R4GKTKtHo4DFcepStU2~2oCZ7P-eP7yONUXRY~~aHcEGSV54ajnjjXW6S13zN4u5ObxMhOt353o2eOGHsivjhzlGGekMVBCYHhFOl4yEC~LlQFfFq~2CBNIw39ZM4xrJUR61UW1VvzV8P4sAEQanGDPKxk94KWVd~Hao3pEpdEsr7VxRE-YDzJ4JQ__',
                  title: 'Summer Outfit',
                ),
                15.hGap,
                DrawersWidget(
                  image:
                      'https://s3-alpha-sig.figma.com/img/26b3/7e99/84178826fa4b929b3e153b3725c4256c?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=U0MKEXRziOszVJAAvOib56g7Y4CSoiBBXF1SWe2Eny06F0dTbwVXH5nIildW-TCeg60NUL86fJSvtBAbA8Vx0t9tlv8ZI90Bd8wjildfVhVCNLziW1X7eLaP3q4XiyXmmjmknkgHv0z-9O7e6mq3N7Xv6ZdX0Ec~Um8a5hy-SF67OwY9eyVk-CGYGjcGdK6qQ883wBzJdwzBFrFIX8jk1m5qXRsy2ZjlC2YFvug5Srpe-WZqlGcxS4loWE9wOmMZQVk7-AJp0coJXcVQYze5ziQrt7o340lPh2YE2osSI1wWn8t~-vY2L0Zm0F7repV3B6gStEFPPXqZYxw23hbvgw__',
                  title: 'Vacations',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _filterBottomSheet(BuildContext context) {
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
            SizedBox(height: 10),
            Text(
              'Adjust',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.hGap,
                Text(
                  'Sort by',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                20.hGap,
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildButton(context, 'Last saved to'),
                    _buildButton(context, 'Alphabetically (A-Z)'),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

String? _selectedSize;
Widget _buildButton(BuildContext context, String label) {
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
          color: isSelected ? Color(0xffEFEDFC) : Colors.transparent,
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
