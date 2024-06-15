import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color fgColor;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.fgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        minimumSize: const Size(150, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
