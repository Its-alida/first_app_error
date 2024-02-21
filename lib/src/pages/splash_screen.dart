import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in_5.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInFive(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 213, 213),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logo(),
            richText(30),
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return Image.asset(
      'assets/splash_image.png',
    );
  }

  Widget richText(double fontSize) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            style: GoogleFonts.inter(
              fontSize: fontSize,
              color: const Color(0xFF21899C),
              letterSpacing: 3,
              height: 1.03,
            ),
            children: const [
              TextSpan(
                text: 'Welcome to ',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: 'VigoraConnect ',
                style: TextStyle(
                  color: Color.fromARGB(255, 236, 64, 118),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'By Team Aarohi',
          style: GoogleFonts.inter(
            fontSize: fontSize - 10,
            color: const Color.fromARGB(255, 78, 76, 77),
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
