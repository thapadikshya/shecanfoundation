import 'package:flutter/material.dart';
import 'package:fundraising/core/constants/app_textstyle.dart';
import '../../core/constants/app_colors.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsetsGeometry padding;

  const AccountButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.cardBackground,
    this.textColor = AppColors.textPrimary,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          side: BorderSide(
            color: backgroundColor.withOpacity(0.3),
            width: 1,
          ),
          padding: padding,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: AppTextStyles.buttonText.copyWith(color: textColor),
        ),
      ),
    );
  }
}
