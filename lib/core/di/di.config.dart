// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i548;
import '../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i923;
import '../../features/auth/data/reopsitory/auth_repository_impl.dart' as _i107;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/domain/usecase/register_usecase.dart' as _i769;
import '../../features/auth/presenation/bloc/auth_cubit.dart' as _i314;
import '../Api/dio_helper.dart' as _i330;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i330.DioHelper>(() => _i330.DioHelper());
    gh.factory<_i548.AuthRemoteDataSource>(
      () => _i923.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i961.AuthRepository>(
      () => _i107.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i548.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i911.LoginUseCase>(
      () => _i911.LoginUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i769.RegisterUseCase>(
      () => _i769.RegisterUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i314.AuthCubit>(
      () => _i314.AuthCubit(
        gh<_i911.LoginUseCase>(),
        gh<_i769.RegisterUseCase>(),
      ),
    );
    return this;
  }
}
