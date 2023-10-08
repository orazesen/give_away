// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:give_away/app/di/common_injectable_module.dart' as _i12;
import 'package:give_away/src/data/data_source/local_data_source_impl.dart'
    as _i8;
import 'package:give_away/src/data/data_source/supabase_auth_data_source_impl.dart'
    as _i5;
import 'package:give_away/src/data/repositories/local_data_repository_impl.dart'
    as _i10;
import 'package:give_away/src/domain/data_source/i_local_data_source.dart'
    as _i7;
import 'package:give_away/src/domain/data_source/i_supabase_auth_data_source.dart'
    as _i4;
import 'package:give_away/src/domain/repositories/i_local_data_repository.dart'
    as _i9;
import 'package:give_away/src/presentation/pages/onboarding/cubit/onboarding_cubit.dart'
    as _i11;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;
import 'package:supabase_flutter/supabase_flutter.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final commonInjectableModule = _$CommonInjectableModule();
    gh.factory<_i3.GoTrueClient>(() => commonInjectableModule.auth);
    gh.factory<_i4.ISupabaseAuthDataSource>(
        () => _i5.SupabaseAuthDataSource(gh<_i3.GoTrueClient>()));
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => commonInjectableModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i3.SupabaseClient>(() => commonInjectableModule.client);
    gh.factory<_i7.ILocalDataSource>(
        () => _i8.LocalDataSourceImpl(gh<_i6.SharedPreferences>()));
    gh.factory<_i9.ILocalDataRepository>(
        () => _i10.LocalDataRepositoryImpl(gh<_i7.ILocalDataSource>()));
    gh.factory<_i11.OnboardingCubit>(
        () => _i11.OnboardingCubit(gh<_i9.ILocalDataRepository>()));
    return this;
  }
}

class _$CommonInjectableModule extends _i12.CommonInjectableModule {}
