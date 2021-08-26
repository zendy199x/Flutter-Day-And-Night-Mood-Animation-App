import 'package:day_night_mood_animation/size_config.dart';
import 'package:flutter/material.dart';

class Land extends StatelessWidget {
  const Land({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenWidth(-65),
      left: 0,
      right: 0,
      child: Image.asset(
        "assets/images/land_tree_light.png",
        height: getProportionateScreenWidth(430),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
