import 'package:amul_galasy/app/constants/constants.dart';
import 'package:amul_galasy/app/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

SliverAppBar appBar(Size size, bool animated) {
  return SliverAppBar(
    expandedHeight: 170,
    toolbarHeight: 70,
    floating: false,
    pinned: true,
    automaticallyImplyLeading: false,
    backgroundColor: kBlackColor,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    flexibleSpace: AnimatedCrossFade(
      crossFadeState: animated ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      sizeCurve: Curves.decelerate,
      firstChild: Container(
        color: kPrimaryColor2,
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [topPart1(size), Expanded(child: topPart2(size))],
        ),
      ),
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      secondChild: topPart2(size),
    ),
  );
}

Container topPart2(Size size) {
  return Container(
    height: 180,
    color: const Color.fromARGB(255, 2, 22, 89),
    padding: EdgeInsets.symmetric(horizontal: size.width / 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.amber.shade400,
            height: size.height,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: Image.asset(
                    'assets/icons/logo.png',
                    fit: BoxFit.contain,
                    width: 70,
                    height: 70,
                  ),
                ),
                const Text(
                  appName,
                  style: TextStyle(color: Colors.white, fontFamily: josefinSansBold, fontWeight: FontWeight.bold, fontSize: 26),
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: ListView.builder(
            itemCount: names.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    '${names[index]}'.tr,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}

Expanded bottomPart2(List list, int flex, String firstName) {
  return Expanded(
    flex: flex,
    child: Wrap(
      children: [
        Text(
          firstName,
          style: const TextStyle(fontFamily: josefinSansBold, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onHover: (value) {
                if (value) {
                } else {}
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  list[index],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}

Widget bottomPart1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        logo,
        width: 100,
        height: 100,
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          'Täze ösüş üçin täze başlangyç.',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      )
    ],
  );
}

Container topPart1(Size size) {
  return Container(
    width: size.width,
    padding: EdgeInsets.symmetric(horizontal: size.width / 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: const [IconAndText(icon: IconlyLight.location, name: address, textSize: 15), IconAndText(icon: IconlyLight.message, name: email, textSize: 15), SizedBox()],
          ),
        ),
        ClipPath(
          clipper: SkewCutLeft(),
          child: Container(
            padding: const EdgeInsets.only(top: 7, bottom: 7, right: 20, left: 60),
            decoration: BoxDecoration(color: Colors.amber.shade400),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Icon(
                      IconlyLight.calling,
                      color: Colors.amber.shade400,
                    ),
                  ),
                ),
                const Text(
                  '+99362990344',
                  style: TextStyle(color: Colors.white, fontSize: 17, fontFamily: josefinSansBold, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
