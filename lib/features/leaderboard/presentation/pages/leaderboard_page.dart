import 'package:flutter/material.dart';
import 'package:fundraising/core/constants/app_colors.dart';
import 'package:fundraising/core/constants/app_textstyle.dart';
import 'package:fundraising/features/leaderboard/domain/entities/leaderboard_entity.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LeaderboardEntity> leaders = [
      const LeaderboardEntity(
          name: 'Alex', score: '₹12,500', isCurrentUser: false),
      const LeaderboardEntity(
          name: 'Priya', score: '₹10,000', isCurrentUser: false),
      const LeaderboardEntity(
          name: 'You', score: '₹5,000', isCurrentUser: true),
      const LeaderboardEntity(
          name: 'Rahul', score: '₹4,500', isCurrentUser: false),
      const LeaderboardEntity(
          name: 'Mia', score: '₹3,200', isCurrentUser: false),
    ];

    return Scaffold(
      body: Column(
        children: [
          // Header with time filter
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top Fundraisers', style: AppTextStyles.headlineSmall),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text('This Month', style: AppTextStyles.bodySmall),
                      const Icon(Icons.keyboard_arrow_down, size: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Leaderboard List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: leaders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final leader = leaders[index];
                return _LeaderboardCard(
                  rank: index + 1,
                  leader: leader,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LeaderboardCard extends StatelessWidget {
  final int rank;
  final LeaderboardEntity leader;

  const _LeaderboardCard({
    required this.rank,
    required this.leader,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: leader.isCurrentUser ? AppColors.primary.withOpacity(0.05) : null,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Rank Indicator
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _getRankColor(rank),
                shape: BoxShape.circle,
              ),
              child: Text(
                rank.toString(),
                style: AppTextStyles.titleMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Name
            Expanded(
              child: Text(
                leader.name,
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: leader.isCurrentUser
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
            // Score
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                leader.score,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return const Color(0xFFFFD700); // Gold
      case 2:
        return const Color(0xFFC0C0C0); // Silver
      case 3:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return AppColors.primary;
    }
  }
}
