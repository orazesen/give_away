import 'package:give_away/src/data/models/app_user/app_user_model.dart';

abstract class ISupabasePostgrestDataSource {
  Future<void> createAppUser({required AppUserModel model});
  Future<void> updateAppUser({required AppUserModel model});
  Future<void> deleteAppUser();
}
