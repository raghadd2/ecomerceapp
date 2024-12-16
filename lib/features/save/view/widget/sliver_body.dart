
import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/core/utils/public_methods.dart';
import 'package:base_project/features/save/view/screen/save_screen.dart';
import 'package:base_project/features/save/view/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliverBodyWidget extends StatelessWidget {
  const SliverBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Save to Drawer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomSearchWidget(
              text: "Search for a drawer",
            ),
          ),
          Container(
            color: Colors.white,
            height: context.height * 0.9,
            child: InkWell(
              onTap: () {
                context.goNamed(NameRoutes.defaultNameRoute);
                PublicMethods.displaySnackBar(
                    color: Colors.black,
                    context: context,
                    message: "Product saved to Summer Outfits");
              },
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                separatorBuilder: (context, index) => 25.hGap,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/455e/9511/a94fd193eb30c3e9901b72933f49a32e?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=O1DRbtLJS21TKm-1MFwlU9xHWDcv99ljYRQTmRFlzPiC1znn5utRvPUs0UqcgtzB6MGG8Et9D~bMmUDrJfF61YigxhexxPtMnnEYA0XSsVuNw3twSrrCUO5F~rjTyVVjRGygsFX3AmP6mvFfPjHwwRSF~z8VstwbzaH3aoEz~mmqB3E5LwF7uNGvAvmqQ5rnMgu-Zh5ki-ZiAKaiEFgc-vKOhlc0q5h4itMMBP0vAR2YOQEqb~AicBpNv9IH8BdfNSikY0PoybVfU58cy2au5n6X-jZ55SDv3yWSqiBNbVGdFqomyb901d-k~SZpXEM9ib7Bx4VjtoiXkALGwDlK7w__',
                          fit: BoxFit.contain,
                          height: 58,
                          width: 48,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Summer Dress',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '27 products',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
