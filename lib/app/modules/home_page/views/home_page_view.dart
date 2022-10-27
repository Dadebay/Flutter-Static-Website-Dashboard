import 'package:amul_galasy/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_widgets.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  ScrollController scrollController = ScrollController();
  bool animated = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset <= 100) {
        setState(() {
          animated = true;
        });
      }
      if (scrollController.offset <= scrollController.position.minScrollExtent && !scrollController.position.outOfRange) {
        setState(() {
          animated = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [appBar(size, animated)];
        },
        body: ListView(
          children: [
            // Banners(size: size),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 600,
              color: Colors.amber.shade400,
              padding: EdgeInsets.only(top: size.height / 8, left: size.width / 24, right: size.width / 24),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: bottomPart1(),
                          ),
                        ),
                        bottomPart2(bottomPartNames1, 2, 'Hyzmatlar'),
                        bottomPart2(bottomPartNames2, 2, 'Biziň sahypalarymyz'),
                        bottomPart2(bottomPartNames3, 2, 'Biziň salgymyz'),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.orange,
                    width: Get.size.width,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: const Text(
                      'Ähli hukuklar goragly © 2022.Web saýt taýýarlady Gurbanow Dadebay',
                      style: TextStyle(color: Colors.white, fontFamily: josefinSansRegular, fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
