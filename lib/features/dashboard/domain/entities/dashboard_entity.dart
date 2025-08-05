import 'package:flutter/material.dart';

class DashboardEntity {
  final String referralCode;
  final String donationAmount;
  final double progressPercentage;
  final List<RewardEntity> rewards;

  const DashboardEntity({
    required this.referralCode,
    required this.donationAmount,
    required this.progressPercentage,
    required this.rewards,
  });
}

class RewardEntity {
  final String title;
  final IconData icon;
  final bool unlocked;

  const RewardEntity({
    required this.title,
    required this.icon,
    required this.unlocked,
  });
}
