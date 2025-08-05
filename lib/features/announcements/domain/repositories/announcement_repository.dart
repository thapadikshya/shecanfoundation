import '../entities/announcement_entity.dart';

abstract class AnnouncementsRepository {
  List<AnnouncementEntity> getAnnouncements();
}
