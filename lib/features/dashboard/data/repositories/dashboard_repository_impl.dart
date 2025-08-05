import 'package:flutter/material.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  @override
  DashboardEntity getDashboardData() {
    return DashboardEntity(
      referralCode: 'intern2025',
      donationAmount: '₹5,000',
      progressPercentage: 50.0,
      rewards: [
        RewardEntity(
            title: 'Bronze Badge',
            unlocked: true,
            icon: Icons.workspace_premium),
        RewardEntity(
            title: 'Silver Badge',
            unlocked: false,
            icon: Icons.workspace_premium),
        RewardEntity(
            title: 'Gold Badge',
            unlocked: false,
            icon: Icons.workspace_premium),
      ],
    );
  }
}
