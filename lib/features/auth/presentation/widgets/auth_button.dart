// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:fundraising/core/constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const AuthButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(395, 55),
        backgroundColor: const Color(0xFF203CCB),

        foregroundColor: const Color.fromARGB(
          255,
          0,
          0,
          0,
        ), //color of text and icon
        elevation: 2,
        shadowColor: AppColors.primary.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
