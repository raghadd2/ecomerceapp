import 'package:base_project/features/home/view/widget/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewStores extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/e8b9/c8b5/023172b7f3e57b46523834d9b37165cc?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=kgEiEeclaHkTdoPX4dSFN9Zos3heZdRc51qx8SJqY-UkWLV-sWdU8-6JBllmRc5alUb800FEddN4kddeEiizMP4Un-ea-3QNgVTLcy4KMAZQ8Ji91gqNJ8YNZyfQIyvptYsLR0Ixucy-1sAdTMjFmciJ64RNKZ-sJkK~HD2841eqGkpzNq3Oyn8H-ASRdH8txUvjyaJMlOar945Ad8AJJ7FHGr5PKl8f9FC0xpP~p2tqZqflEYZoKKpUnBHChR~OXvjuZ5Dh987R4-eAWZqTSIlyZ30xf8zyrNT7ZIFf03RB7n298dxako8ZSdhYTU8Hr1B20xwrZIyAtlGqcwy1Tw__',
      'title': 'Levi\'s',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/f9a8/2e85/af98a770dae1e338a40fbbc5716a2de7?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cNKZBcXZHVrU0uRUbR7CaVkg-9C4Z8ve9gjTWdK-bdOxono3X9sUkmzvZoyCFQ-XPJXyO6W8vXceeaAYuQiYGMi989RVK4vcmsCstNF2~JKkciscrAq7x0bK8knlEOek8~pWoSIk6o4BUmH5fCDyeiQ8LMdhOf20bDfhBevNap5QRe2mLJAwJJjE7CxOlVhHjAXqF3XFW040eJayE5MxucsXReuRGK2gVnkmiZQWc9dJWlEESytLqKeFK5~t1aAjq~7EnoItqyxEMpIrbGvDuunuLvnci1HwHLu~uBJC38U2SdMJvW6VhvhcExvuuqLnr6qg-Y-Yeh8zGguteYAI6w__',
      'title': 'Lacoste',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/5bba/3685/10ee244b4baa8276ccbac9f08fddffce?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jwtB9dCU0jwe2uG5-uH1rtQTFWuuhnhBYZCacZnAj0Hf1OPWSCYpSykL8DVU5USe-MM2Hb0c3gvEA83uRQfDYYXN73wkHpps~OlaURmZYeTF8JUKr75Qx3NBdVBWqFoPpCRdiCkQwIeiZUmf6hbc9H42dEMVZkuT9wOh32zQxVMYzXVTlgDquYg1gFgE96FNalKbUbRzn1Sdp~TvNkSbm--slWTLtu~gsKzTwp3nB~LBF~Dy9DfR7dzsJxbdnfstbNS-tbiOmJz9KAjgzNveJNRSO7zdhiIn9dUweAxVcdgL0Rc1YH43ZgGiqfwbuUTxkfHJb7TxmgsxckZDVNrvpA__',
      'title': 'bershka',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/cbfe/f6ba/2cdd7a9e0914ac10aa04e702712534d6?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=IREsRXMix6Ho8-KHUFofoqCaz2LAcxcNG313X2pqs8Q9N7bWoBWxOfkwLJBBKXyzQV8eTQnjE89xcGHfi-QUG1TULkwIIRUoSZVyPeby1Y26yl3JkbLtLKrVVlvGZYjzJL43Tn924MI9eF6NUi-SMZbNkBBwFP-d~B4~QjdYCUjjIzwXxGqoRjDMJa~t2ZsbUwLBI-0qD4GOGPvo-6TIgSq4FzYlkxf4DfI58tYAv8Ket085TrD8R8ioQ~eYOF2fVeKBNjGW0exmSZu0Lea4LEbxCfW-ZHdltilp9BL-y3q4-oU-xyQbgPFCw1XBKWmUMR1ek2hEGcdn4~BJFTrXnA__',
      'title': 'Adidas',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/1a19/cadf/5967ea68bf2d134ca36a96d905eb1afe?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LnS6xfNfROrSADsy628Gd9XGeZyKiKQgC8x8vKTvyy1yAaXM2zk5ejLNUfxXpvGBkCOe5T~wbX7mfuyKkvnXmwHEW9VXbqZUKN3PIvQJo99MPnJ4Du28L7Eee-A7RZCq2By9PRp1PQBfauSW86s4Uipo3EXs-C7rox2uvWroTf~zegM12YCDvLqEw7R8FvFVGDDdRPG-tKFPB6RlTZD4YfeUb769tnLjMHzCHM5YkZ9U4YxuRktsZEHtuKKRxDzkayrdiB6SQmzBHMDcrq2U1zBfDJGIJVsE8T3i9EwvpohHCQv~dHAe8clWtmJflkwxLL-vz8FLLaQcqAABfs6s-w__',
      'title': 'zara',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/24a6/5dfd/3b4aee77a8e0b75f5e6b96c4ebf40570?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=FRsqy0TeiwF72WgB9ptohi5PkIvjexcmeEl-6L09d7VpD06Udkv3-w~qMgHsWmwLwh4Ha4xK0BE4QKdyCT-QKDmuWlMyHBRKKrItG42oQgE~OAvdbN77HN~LJhWUkq4CPkOgVEHo0kAWUqlD6bpTOgUNrVRg5wrSWo97FtDeAPXeRaESEgA-VXDgvy0B0o9K7YD7smUwp5e3w9FoP40w3s2eoeLir5kZJfw59lHCf-Vaq1bFaqgD6GcgkBrDLfCKvTvFCU5qesBvv7tfcQ4YBeyPEpox8ZRrXuvPdbJqyuRFaejvQmsuAcshA9ieH2J-lGkGEPjJrgh67opl-hit6g__',
      'title': 'Boss',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/bec0/845e/c2fbbc66b8f00e6975d5b5f7b2c51b62?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hcoFbXHvccLeTbJRhCtWkuEH3othU3qGV5a3VY7qeDxVz5OcLam~YPLXx5NAvFp0O8naq7BX1dR2zudAViDj~oBj1wWgxLh25B4UcxAgRvNYBOgnCyMJ5PkVZSDl0DQxvr9AwrdSfeCNwmIs0yN1ZkjklIonUBl~H0hKjsweT3oXWspTixckn3P9PWFVWGCx14smz2iwllbv7r8cspm9gG~~bgRFaLSL1wKlaKqz4q4RG0JuH5dWQQNs7OKI6YU2d1wgWU7deSSq42XjX-o~NESE28HwizkwNdegyL5AGjRWkBLYgtcgdYkUXhH5o1TdF1fW5GyVCWNnjmYLlILqFA__',
      'title': 'Mango',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/a4fb/7e67/52284eb1155f426eec29e40dfcf2eee8?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=e8RUIUAl7gSYiiPmB3gEEaZ3A440NohB69SqYRhU3~ANdQ0zpBMgL6iOIKeZU-wkvC3zLwnd2Ps7Mz~BVPqRpBNyUb018nu~G7h8mGv2wa5fqXgmJ~W7QHM~LL~1BzFMlbio3NAG1152r6C~Grq4Ue5dWEWs9SW1TuANUiXHzmFGYUWVwmCG35M41KR5mFTo4yxF9Op1-Kv0jam3s0DrjTsSriCVRsoE-k9ZOShH9s8qw4VrOJFzvfM7fH4hvV~HuoagRnz-GnOCldpOC6GNxn-5eAmxREUJTCmFmoM78nHKM99mBr0iVi7Lxvy1RZEaceBRnEKY42v0inHnr5WgoQ__',
      'title': 'calvin klein',
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/c4ee/fa1e/940ec5ffcf90f8d7916394a334518b9f?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EiWRDjRDUfMNx4LZgarEL-ESFDZJfANeUSGYDSLNaNbOFkTMStTV6MJD82PwbfndOeMNdtB8lSt~NaZrpE09QAv~N~zk3NUNij-NxBfdLkHVd5~~xXZE~g-fb80TbxYO~aUy64yOL2KBB5-OXf6WuSgNBpOVTSIb3kjD-UrDUaTOH2qujirzAcPgL2LxKyMHfuWOpKCwbxULtvnuZB6KxdEMpJ7F3YrnAqoTQJwToEUc67PmbJ0fuewM0pOd-KO9XkWdMb9HU8NPyyPMYXWJ1f3roaywI6iPAjnzLRlHzVkY-QulhDyI-p6BR53MgSLwbNsyRHTgB-To-LKssDMu4Q__',
      'title': 'Dockers',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New stores',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Explore the brands that just joined Tassel!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600)),
            Flexible(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 35.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: Color(0xffE7E7E8), width: 4),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(Icons.error),

                        placeholder: (context, url) => Shimmer_widget(),
                                imageUrl:
                                // height: 90,
                                products[index]['image'],
                                // width: 90,
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(height: 8),
                        Flexible(
                          child: Text(
                            products[index]['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NewStores(),
  ));
}
