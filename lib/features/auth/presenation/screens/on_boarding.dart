import 'package:authh/core/utils/app_colors.dart';
import 'package:authh/core/widgets/app_button.dart';
import 'package:authh/core/widgets/custom_text.dart';
import 'package:authh/features/auth/presenation/screens/login.dart';
import 'package:authh/features/auth/presenation/screens/sign_up.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black, // Dark blue gradient color
      body: Stack(
        children: [
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 60,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp(),));
                    },
                    child: CustomText(
                      text: "Sign Up",
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.grey.shade800,
                  ),
                  SizedBox(height: 15),
                  AppButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: CustomText(
                      text: "Log In",
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
