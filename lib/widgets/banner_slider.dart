import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key}) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {

  final PageController controller = PageController();

  int currentIndex = 0;

  final List<String> banners = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: controller,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(banners[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );

            },
          ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) {

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentIndex == index ? 10 : 6,
                height: currentIndex == index ? 10 : 6,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? Colors.green
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );

            },
          ),
        ),

      ],
    );
  }
}
