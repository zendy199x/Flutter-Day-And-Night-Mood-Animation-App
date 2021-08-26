import 'package:day_night_mood_animation/screens/login/body.dart';
import 'package:day_night_mood_animation/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      body: Body(),
    );
  }
}
