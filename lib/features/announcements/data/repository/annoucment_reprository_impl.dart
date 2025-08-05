import 'package:fundraising/features/announcements/domain/repositories/announcement_repository.dart';

import '../../domain/entities/announcement_entity.dart';

class AnnouncementsRepositoryImpl implements AnnouncementsRepository {
  @override
  List<AnnouncementEntity> getAnnouncements() {
    return [
      AnnouncementEntity(
        id: '1',
        title: 'New Fundraising Challenge',
        content: 'Top 3 fundraisers will get special rewards next month!',
        date: DateTime(2025, 8, 1),
      ),
      AnnouncementEntity(
        id: '2',
        title: 'System Maintenance',
        content: 'App will be unavailable on August 5 from 2:00 AM to 4:00 AM.',
        date: DateTime(2025, 7, 30),
      ),
      AnnouncementEntity(
        id: '3',
        title: 'Welcome New Interns!',
        content: '10 new interns joined our program this month.',
        date: DateTime(2025, 7, 25),
      ),
    ];
  }
}
