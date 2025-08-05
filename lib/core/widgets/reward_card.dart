import 'package:flutter/material.dart';
import 'package:fundraising/core/constants/app_textstyle.dart';
import '../../core/constants/app_colors.dart';

class RewardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isUnlocked;
  final VoidCallback? onTap;
  final double width;
  final double iconSize;
  final double lockIconSize;

  const RewardCard({
    super.key,
    required this.icon,
    required this.title,
    this.isUnlocked = false,
    this.onTap,
    this.width = 110,
    this.iconSize = 36,
    this.lockIconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isUnlocked ? onTap : null,
      child: MouseRegion(
        cursor:
            isUnlocked ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: Semantics(
          button: true,
          enabled: isUnlocked,
          label: 'Reward Card: $title',
          child: Container(
            width: width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUnlocked
                  ? AppColors.primary.withOpacity(0.1)
                  : AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isUnlocked
                    ? AppColors.primary.withOpacity(0.3)
                    : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: iconSize,
                  color:
                      isUnlocked ? AppColors.primary : AppColors.textSecondary,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.w600, // Slightly bolder
                    color: isUnlocked
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (!isUnlocked)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.lock_outline,
                      size: lockIconSize,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
