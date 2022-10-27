import 'package:amul_galasy/app/constants/constants.dart';
import 'package:flutter/material.dart';

dynamic spinKit() {
  return const CircularProgressIndicator(
    color: kPrimaryColor,
  );
}

class IconAndText extends StatelessWidget {
  const IconAndText({
    Key? key,
    required this.name,
    required this.icon,
    required this.textSize,
  }) : super(key: key);
  final String name;
  final IconData icon;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 4),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}

class SkewCutLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(
      45,
      size.height,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(SkewCutLeft oldClipper) => false;
}
