import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {

  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 160,
      child: PageView(
        children: [

          _banner("assets/images/banner1.jpg"),
          _banner("assets/images/banner2.jpg"),
          _banner("assets/images/banner3.jpg"),

        ],
      ),
    );
  }

  Widget _banner(String image){

    return Container(
      margin: const EdgeInsets.symmetric(horizontal:12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
