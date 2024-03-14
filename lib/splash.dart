import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controller/splash_controller.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(Duration(seconds: 5), () {
      splashScreenProvider.setLoading(false);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your splash screen content goes here
            Text(
              "NEWS TODAY",
              style: GoogleFonts.abrilFatface(
                  fontSize: 30, color: Color.fromARGB(255, 63, 202, 233)),
            ),
            // if (splashScreenProvider.isLoading)
            //   Image.asset(
            //     "assets/image/news.png",
            //     fit: BoxFit.cover,
            //   )
          ],
        ),
      ),
    );
  }
}
