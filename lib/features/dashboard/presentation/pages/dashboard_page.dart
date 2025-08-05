import 'package:flutter/material.dart';
import 'package:fundraising/core/constants/app_colors.dart';
import 'package:fundraising/core/constants/app_textstyle.dart';
import 'package:fundraising/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:fundraising/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:fundraising/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fundraising/features/announcements/presentation/pages/announcement_page.dart';
import 'package:fundraising/features/leaderboard/presentation/pages/leaderboard_page.dart';

class DashboardPage extends StatefulWidget {
  final DashboardRepository? repository;

  const DashboardPage({
    super.key,
    this.repository,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  final DashboardRepository _repository = DashboardRepositoryImpl();

  final List<Widget> _pages = [
    const HomeContent(),
    const LeaderboardPage(),
    const AnnouncementsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(_currentIndex == 0
            ? 'Dashboard'
            : _currentIndex == 1
                ? 'Leaderboard'
                : 'Announcements'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined),
              activeIcon: Icon(Icons.leaderboard),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement_outlined),
              activeIcon: Icon(Icons.announcement),
              label: 'Announcements',
            ),
          ],
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardData = DashboardRepositoryImpl().getDashboardData();
    final progressPercentage = dashboardData.progressPercentage;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(context),
          const SizedBox(height: 24),
          _buildStatsSection(dashboardData),
          const SizedBox(height: 24),
          _buildProgressSection(progressPercentage),
          const SizedBox(height: 24),
          _buildRewardsSection(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi,', style: AppTextStyles.headlineLarge),
          Text('Amisha!', style: AppTextStyles.headlineLarge),
        ],
      ),
    );
  }

  Widget _buildStatsSection(DashboardEntity data) {
    return Row(
      children: [
        Expanded(
            child: _StatCard(
          title: 'Total Raised',
          value: data.donationAmount,
          icon: Icons.attach_money,
          color: AppColors.primary,
        )),
        const SizedBox(width: 12),
        Expanded(
            child: _StatCard(
          title: 'Referral Code',
          value: data.referralCode,
          icon: Icons.share,
          color: AppColors.secondary,
        )),
      ],
    );
  }

  Widget _buildProgressSection(double percentage) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fundraising Progress', style: AppTextStyles.titleMedium),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 12,
              borderRadius: BorderRadius.circular(6),
              color: AppColors.progresscolor,
              backgroundColor: AppColors.progressBackground.withOpacity(0.1),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${percentage.toStringAsFixed(0)}% Completed',
                    style: AppTextStyles.bodySmall),
                Text('Goal: ₹10,000', style: AppTextStyles.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Rewards', style: AppTextStyles.titleMedium),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _rewardData.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) => RewardCard(data: _rewardData[index]),
          ),
        ),
      ],
    );
  }

  static const List<RewardCardData> _rewardData = [
    RewardCardData(
      icon: Icons.emoji_events,
      color: Color(0xFFCD7F32),
      unlockedColor: AppColors.background,
      borderColor: Color(0xFFCD7F32),
      iconColor: Color(0xFFCD7F32),
      textColor: Colors.black,
      isUnlocked: true,
      title: 'Bronze Donor',
    ),
    RewardCardData(
      icon: Icons.emoji_events,
      color: Color(0xFFC0C0C0),
      unlockedColor: AppColors.progressBackground,
      borderColor: Color(0xFFC0C0C0),
      iconColor: Color(0xFFC0C0C0),
      textColor: Colors.black,
      isUnlocked: false,
      title: 'Silver Donor',
    ),
    RewardCardData(
      icon: Icons.emoji_events,
      color: Color(0xFFFFD700),
      unlockedColor: AppColors.secondary,
      borderColor: Color(0xFFFFD700),
      iconColor: Color(0xFFFFD700),
      textColor: Colors.black,
      isUnlocked: false,
      title: 'Gold Donor',
    ),
  ];
}

class RewardCardData {
  final IconData icon;
  final Color color;
  final Color unlockedColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final bool isUnlocked;
  final String title;

  const RewardCardData({
    required this.icon,
    required this.color,
    required this.unlockedColor,
    this.borderColor,
    this.iconColor,
    this.textColor,
    required this.isUnlocked,
    required this.title,
  });
}

class RewardCard extends StatelessWidget {
  final RewardCardData data;

  const RewardCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: data.isUnlocked ? () {} : null,
      child: MouseRegion(
        cursor: data.isUnlocked
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: Semantics(
          button: true,
          enabled: data.isUnlocked,
          label: 'Reward Card: ${data.title}',
          child: Container(
            width: 110,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: data.isUnlocked
                  ? data.unlockedColor
                  : AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: data.isUnlocked
                    ? (data.borderColor ?? data.color)
                    : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  data.icon,
                  size: 36,
                  color: data.isUnlocked
                      ? (data.iconColor ?? data.color)
                      : AppColors.textSecondary,
                ),
                const SizedBox(height: 8),
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.w600,
                    color: data.isUnlocked
                        ? (data.textColor ?? data.color)
                        : AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (!data.isUnlocked)
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.lock_outline,
                      size: 16,
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

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(title, style: AppTextStyles.bodySmall),
            const SizedBox(height: 4),
            Text(value, style: AppTextStyles.titleLarge),
          ],
        ),
      ),
    );
  }
}
