class LeaderboardEntity {
  final String name;
  final String score;
  final bool isCurrentUser;

  const LeaderboardEntity({
    required this.name,
    required this.score,
    required this.isCurrentUser,
  });
}
