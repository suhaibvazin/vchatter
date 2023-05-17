import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vchatter/helper_functions/navigator.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigateToHome(); // Call the function to navigate to the main screen
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(createRoute(context, const LoginPageView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Customize the splash screen appearance here
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 20, 39),
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/cookie_logo.svg',
              height: 170,
              width: 170,
            ), // Replace with your logo widget
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.only(
                    bottom: 150.0), // Adjust the margin as needed
                child: const Text(
                  'Cookies',
                  style: TextStyle(
                      fontFamily: 'product sans',
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
