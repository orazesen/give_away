import 'dart:developer';

import 'package:give_away/src/core/const.dart';
import 'package:give_away/src/data/models/app_user/app_user_model.dart';
import 'package:give_away/src/domain/data_source/i_supabase_postgrest_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String _tag = 'SupabasePostgrestDataSource';

@Injectable(as: ISupabasePostgrestDataSource)
class SupabasePostgrestDataSource implements ISupabasePostgrestDataSource {
  final PostgrestClient _rest;

  SupabasePostgrestDataSource(this._rest);

  @override
  Future<void> createAppUser({required AppUserModel model}) async {
    try {
      await _rest.from(GiveAwaySupabaseTables.clients).insert(model.toJson());
    } catch (e) {
      log('User creation failed', error: e, name: _tag);
      rethrow;
    }
  }

  @override
  Future<void> deleteAppUser() {
    // TODO: implement deleteAppUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateAppUser({required AppUserModel model}) {
    // TODO: implement updateAppUser
    throw UnimplementedError();
  }
}
