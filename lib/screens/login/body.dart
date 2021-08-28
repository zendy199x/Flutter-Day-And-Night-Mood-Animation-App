import 'package:day_night_mood_animation/constants.dart';
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
  bool _isFullSun = false;
  bool _isDayMood = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(kDuration, () {
      // Starting _isFullSun = false but after 1 second we set it true
      setState(() {
        _isFullSun = true;
      });
    });
  }

  void changeMood(int activeTab) {
    if (activeTab == 0) {
      // Then it's day
      // Let's make it more better
      setState(() {
        _isFullSun = true;
      });
      // At first it set _isDayMood to true then after 300 miliseconds set sun our to full
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _isDayMood = true;
        });
      });
    } else {
      setState(() {
        _isFullSun = false;
      });
      // Do the same for Night mood
      // At first sun goes down then the background changes slowly
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _isDayMood = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      const Color(0xFF8C2480),
      const Color(0xFFCE587D),
      const Color(0xFFFF9485),
      // Also add more light on background
      if (_isFullSun) const Color(0xFFFF9D80)
    ];

    // Background color for night
    List<Color> darkBgColors = [
      const Color(0xFF0D1441),
      const Color(0xFF283584),
      const Color(0xFF376AB2),
    ];

    return AnimatedContainer(
      // Now the Background get lighter slowly
      duration: kDuration,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _isDayMood ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          // Sun
          // I want to rise the sun from group
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: kDuration,
            left: getProportionateScreenWidth(30),
            bottom: getProportionateScreenWidth(_isFullSun ? -45 : -120),
            child: SvgPicture.asset("assets/icons/Sun.svg"),
          ),
          // Land
          const Land(),
          // Others, Text, Tabs and Text Field
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
                    press: (value) {
                      changeMood(value);
                    },
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
