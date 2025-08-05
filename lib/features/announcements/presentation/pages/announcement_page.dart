import 'package:flutter/material.dart';

import 'package:fundraising/features/announcements/data/repository/annoucment_reprository_impl.dart';
import 'package:fundraising/features/announcements/domain/repositories/announcement_repository.dart';
import 'package:fundraising/features/announcements/presentation/widgets/announcement_card.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AnnouncementsRepository repository = AnnouncementsRepositoryImpl();
    final announcements = repository.getAnnouncements();

    return Scaffold(
     
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          return AnnouncementCard(announcement: announcements[index]);
        },
      ),
    );
  }
}
