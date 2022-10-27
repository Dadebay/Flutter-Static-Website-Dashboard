import 'package:amul_galasy/app/constants/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class Banners extends StatelessWidget {
  const Banners({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          CarouselSlider.builder(
            unlimitedMode: true,
            slideBuilder: (index) {
              return Container(
                color: Colors.amber.shade400,
                width: size.width,
                child: Image.asset(
                  'assets/image/${index + 1}.jpg',
                  fit: BoxFit.cover,
                ),
              );
            },
            slideTransform: const ZoomOutSlideTransform(),
            slideIndicator: CircularSlideIndicator(
              padding: const EdgeInsets.only(bottom: 32),
            ),
            itemCount: 3,
          ),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  '<<Amul Galasay>> HJ',
                  textStyle: const TextStyle(
                    fontSize: 80.0,
                    fontFamily: josefinSansBold,
                    color: kPrimaryColor2,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 2,
              isRepeatingAnimation: true,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
        ],
      ),
    );
  }
}
