import 'package:day_night_mood_animation/size_config.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    @required this.press,
  }) : super(key: key);

  final ValueChanged<int>? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.8, // 80%
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorColor: Colors.white,
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          onTap: press,
          tabs: const [
            Tab(text: "Morning Login"),
            Tab(text: "Night Login"),
          ],
        ),
      ),
    );
  }
}
