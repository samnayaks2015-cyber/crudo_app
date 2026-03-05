import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key}) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {

  final List<String> banners = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: controller,
            itemCount: banners.length,
            onPageChanged: (index){
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context,index){
              return Container(
                margin: const
