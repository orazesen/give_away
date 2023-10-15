// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:give_away/app/di/common_injectable_module.dart' as _i16;
import 'package:give_away/src/data/data_source/local_data_source_impl.dart'
    as _i11;
import 'package:give_away/src/data/data_source/supabase_auth_data_source_impl.dart'
    as _i5;
import 'package:give_away/src/data/repositories/local_data_repository_impl.dart'
    as _i13;
import 'package:give_away/src/data/repositories/user_repository_impl.dart'
    as _i7;
import 'package:give_away/src/domain/data_source/i_local_data_source.dart'
    as _i10;
import 'package:give_away/src/domain/data_source/i_supabase_auth_data_source.dart'
    as _i4;
import 'package:give_away/src/domain/repositories/i_local_data_repository.dart'
    as _i12;
import 'package:give_away/src/domain/repositories/i_user_repository.dart'
    as _i6;
import 'package:give_away/src/presentation/common_cubits/theme/theme_cubit.dart'
    as _i15;
import 'package:give_away/src/presentation/common_cubits/user/user_cubit.dart'
    as _i9;
import 'package:give_away/src/presentation/pages/onboarding/cubit/onboarding_cubit.dart'
    as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
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
    gh.factory<_i6.IUserRepository>(
        () => _i7.UserRepositoryImpl(gh<_i4.ISupabaseAuthDataSource>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => commonInjectableModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i3.SupabaseClient>(() => commonInjectableModule.client);
    gh.factory<_i9.UserCubit>(() => _i9.UserCubit(gh<_i6.IUserRepository>()));
    gh.factory<_i10.ILocalDataSource>(
        () => _i11.LocalDataSourceImpl(gh<_i8.SharedPreferences>()));
    gh.factory<_i12.ILocalDataRepository>(
        () => _i13.LocalDataRepositoryImpl(gh<_i10.ILocalDataSource>()));
    gh.factory<_i14.OnboardingCubit>(
        () => _i14.OnboardingCubit(gh<_i12.ILocalDataRepository>()));
    gh.factory<_i15.ThemeCubit>(
        () => _i15.ThemeCubit(gh<_i12.ILocalDataRepository>()));
    return this;
  }
}

class _$CommonInjectableModule extends _i16.CommonInjectableModule {}
