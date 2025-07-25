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
import '../../features/prediction/data/data_source/prediction_remote_data_source.dart'
    as _i813;
import '../../features/prediction/data/data_source/prediction_remote_data_source_impl.dart'
    as _i427;
import '../../features/prediction/data/repo/prediction_repo_impl.dart'
    as _i1049;
import '../../features/prediction/domain/repositories/prediction_repository.dart'
    as _i989;
import '../../features/prediction/domain/usecases/get_prediction_usecase.dart'
    as _i222;
import '../../features/prediction/presentation/bloc/prediction_cubit.dart'
    as _i199;
import '../../features/weather/data/data_source/weather_remote_data_source.dart'
    as _i220;
import '../../features/weather/data/data_source/weather_remote_data_source_impl.dart'
    as _i282;
import '../../features/weather/data/repository/weather_repository_impl.dart'
    as _i265;
import '../../features/weather/domain/repository/weather_repository.dart'
    as _i647;
import '../../features/weather/domain/usecase/get_current_weather.dart' as _i30;
import '../../features/weather/domain/usecase/get_forecast_weather.dart'
    as _i712;
import '../../features/weather/presentation/bloc/forecast_bloc.dart' as _i697;
import '../../features/weather/presentation/bloc/weather_bloc.dart' as _i433;
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
    gh.factory<_i220.WeatherRemoteDataSource>(
      () => _i282.WeatherRemoteDataSourceImpl(),
    );
    gh.factory<_i961.AuthRepository>(
      () => _i107.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i548.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i813.PredictionRemoteDataSource>(
      () => _i427.PredictionRemoteDataSourceImpl(),
    );
    gh.factory<_i911.LoginUseCase>(
      () => _i911.LoginUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i769.RegisterUseCase>(
      () => _i769.RegisterUseCase(authRepository: gh<_i961.AuthRepository>()),
    );
    gh.factory<_i647.WeatherRepository>(
      () => _i265.WeatherRepositoryImpl(
        remoteDataSource: gh<_i220.WeatherRemoteDataSource>(),
      ),
    );
    gh.factory<_i989.PredictionRepository>(
      () => _i1049.PredictionRepoImpl(
        predictionRemoteDataSource: gh<_i813.PredictionRemoteDataSource>(),
      ),
    );
    gh.factory<_i222.GetPredictionUseCase>(
      () => _i222.GetPredictionUseCase(gh<_i989.PredictionRepository>()),
    );
    gh.factory<_i199.PredictionCubit>(
      () => _i199.PredictionCubit(gh<_i222.GetPredictionUseCase>()),
    );
    gh.factory<_i314.AuthCubit>(
      () => _i314.AuthCubit(
        gh<_i911.LoginUseCase>(),
        gh<_i769.RegisterUseCase>(),
      ),
    );
    gh.factory<_i30.GetCurrentWeather>(
      () => _i30.GetCurrentWeather(repository: gh<_i647.WeatherRepository>()),
    );
    gh.factory<_i712.GetForecastWeather>(
      () => _i712.GetForecastWeather(repository: gh<_i647.WeatherRepository>()),
    );
    gh.factory<_i697.ForecastCubit>(
      () => _i697.ForecastCubit(gh<_i712.GetForecastWeather>()),
    );
    gh.factory<_i433.WeatherCubit>(
      () => _i433.WeatherCubit(
        getCurrentWeather: gh<_i30.GetCurrentWeather>(),
        getForecastWeather: gh<_i712.GetForecastWeather>(),
      ),
    );
    return this;
  }
}
