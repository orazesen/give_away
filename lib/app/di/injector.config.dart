// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:give_away/app/di/common_injectable_module.dart' as _i20;
import 'package:give_away/src/data/data_source/local_data_source_impl.dart'
    as _i8;
import 'package:give_away/src/data/data_source/supabase_auth_data_source_impl.dart'
    as _i5;
import 'package:give_away/src/data/data_source/supabase_postgrest_data_source_impl.dart'
    as _i10;
import 'package:give_away/src/data/repositories/local_data_repository_impl.dart'
    as _i17;
import 'package:give_away/src/data/repositories/user_repository_impl.dart'
    as _i12;
import 'package:give_away/src/domain/data_source/i_local_data_source.dart'
    as _i7;
import 'package:give_away/src/domain/data_source/i_supabase_auth_data_source.dart'
    as _i4;
import 'package:give_away/src/domain/data_source/i_supabase_postgrest_data_source.dart'
    as _i9;
import 'package:give_away/src/domain/repositories/i_local_data_repository.dart'
    as _i16;
import 'package:give_away/src/domain/repositories/i_user_repository.dart'
    as _i11;
import 'package:give_away/src/presentation/common_cubits/theme/theme_cubit.dart'
    as _i19;
import 'package:give_away/src/presentation/common_cubits/user/user_cubit.dart'
    as _i15;
import 'package:give_away/src/presentation/pages/authentication/login/cubit/login_cubit.dart'
    as _i13;
import 'package:give_away/src/presentation/pages/authentication/registration/cubit/registration_cubit.dart'
    as _i14;
import 'package:give_away/src/presentation/pages/onboarding/cubit/onboarding_cubit.dart'
    as _i18;
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
    gh.factory<_i3.PostgrestClient>(() => commonInjectableModule.postgrest);
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => commonInjectableModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i7.ILocalDataSource>(
        () => _i8.LocalDataSourceImpl(gh<_i6.SharedPreferences>()));
    gh.factory<_i9.ISupabasePostgrestDataSource>(
        () => _i10.SupabasePostgrestDataSource(gh<_i3.PostgrestClient>()));
    gh.factory<_i11.IUserRepository>(() => _i12.UserRepositoryImpl(
          gh<_i4.ISupabaseAuthDataSource>(),
          gh<_i9.ISupabasePostgrestDataSource>(),
        ));
    gh.factory<_i13.LoginCubit>(
        () => _i13.LoginCubit(gh<_i11.IUserRepository>()));
    gh.factory<_i14.RegistrationCubit>(
        () => _i14.RegistrationCubit(gh<_i11.IUserRepository>()));
    gh.factory<_i15.UserCubit>(
        () => _i15.UserCubit(gh<_i11.IUserRepository>()));
    gh.factory<_i16.ILocalDataRepository>(
        () => _i17.LocalDataRepositoryImpl(gh<_i7.ILocalDataSource>()));
    gh.factory<_i18.OnboardingCubit>(
        () => _i18.OnboardingCubit(gh<_i16.ILocalDataRepository>()));
    gh.factory<_i19.ThemeCubit>(
        () => _i19.ThemeCubit(gh<_i16.ILocalDataRepository>()));
    return this;
  }
}

class _$CommonInjectableModule extends _i20.CommonInjectableModule {}
