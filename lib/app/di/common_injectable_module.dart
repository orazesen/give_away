import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class CommonInjectableModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  PostgrestClient get postgrest => Supabase.instance.client.rest;

  GoTrueClient get auth => Supabase.instance.client.auth;
}
