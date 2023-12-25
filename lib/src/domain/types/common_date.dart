import 'package:give_away/src/domain/types/tare_tag_date_time.dart';

class CommonDate {
  final GiveAwayDateTime createdAt;
  final GiveAwayDateTime updatedAt;
  final GiveAwayDateTime deletedAt;

  const CommonDate({
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  String toString() {
    return 'CommonDate(createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }
}
