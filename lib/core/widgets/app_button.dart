import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
   void Function()? onPressed;
   Widget? child;
   Color? backgroundColor;
   AppButton({
     super.key,
     required this.onPressed,
     required this.child,
     this.backgroundColor
   });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          child: child,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.symmetric(vertical: 16)
        ),
      ),
    );
  }
}
