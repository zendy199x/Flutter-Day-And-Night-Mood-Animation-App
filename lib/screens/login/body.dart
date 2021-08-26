import 'package:day_night_mood_animation/screens/login/land.dart';
import 'package:day_night_mood_animation/screens/login/rounded_text_field.dart';
import 'package:day_night_mood_animation/screens/login/tabs.dart';
import 'package:day_night_mood_animation/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      const Color(0xFF8C2480),
      const Color(0xFFCE587D),
      const Color(0xFFFF9485),
    ];

    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: lightBgColors,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: getProportionateScreenWidth(30),
            bottom: getProportionateScreenWidth(-45),
            child: SvgPicture.asset("assets/icons/Sun.svg"),
          ),
          const Land(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacing(of: 50),
                  Tabs(
                    press: (value) {},
                  ),
                  const VerticalSpacing(),
                  Text(
                    "Good Morning",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const VerticalSpacing(of: 10),
                  const Text(
                    "Enter your Informations below",
                    style: TextStyle(color: Colors.white),
                  ),
                  const VerticalSpacing(of: 50),
                  const RoundedTextField(
                    initialValue: "zendy199x@gmail.com",
                    hintText: "Email",
                  ),
                  const VerticalSpacing(),
                  const RoundedTextField(
                    initialValue: "XXXXXXX",
                    hintText: "Password",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
