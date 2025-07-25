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

import '../../../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i122;
import '../../../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i1059;
import '../../../../features/auth/data/reopsitory/auth_repository_impl.dart'
    as _i630;
import '../../../../features/auth/domain/repository/auth_repository.dart'
    as _i487;
import '../../../../features/auth/domain/usecase/login_usecase.dart' as _i1064;
import '../../../../features/auth/domain/usecase/register_usecase.dart' as _i32;
import '../../../../features/auth/presenation/bloc/auth_cubit.dart' as _i340;
import '../../../../features/prediction/data/data_source/prediction_remote_data_source.dart'
    as _i1036;
import '../../../../features/prediction/data/data_source/prediction_remote_data_source_impl.dart'
    as _i881;
import '../../../../features/prediction/data/repo/prediction_repo_impl.dart'
    as _i515;
import '../../../../features/prediction/domain/repositories/prediction_repository.dart'
    as _i715;
import '../../../../features/prediction/domain/usecases/get_prediction_usecase.dart'
    as _i415;
import '../../../../features/prediction/presentation/bloc/prediction_cubit.dart'
    as _i464;
import '../../../../features/weather/data/data_source/weather_remote_data_source.dart'
    as _i872;
import '../../../../features/weather/data/data_source/weather_remote_data_source_impl.dart'
    as _i746;
import '../../../../features/weather/data/repository/weather_repository_impl.dart'
    as _i665;
import '../../../../features/weather/domain/repository/weather_repository.dart'
    as _i285;
import '../../../../features/weather/domain/usecase/get_current_weather.dart'
    as _i660;
import '../../../../features/weather/domain/usecase/get_forecast_weather.dart'
    as _i781;
import '../../../../features/weather/presentation/bloc/forecast_bloc.dart'
    as _i6;
import '../../../../features/weather/presentation/bloc/weather_bloc.dart'
    as _i136;
import '../../../Api/dio_helper.dart' as _i330;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i330.DioHelper>(() => _i330.DioHelper());
    gh.factory<_i122.AuthRemoteDataSource>(
      () => _i1059.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i872.WeatherRemoteDataSource>(
      () => _i746.WeatherRemoteDataSourceImpl(),
    );
    gh.factory<_i487.AuthRepository>(
      () => _i630.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i122.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i1036.PredictionRemoteDataSource>(
      () => _i881.PredictionRemoteDataSourceImpl(),
    );
    gh.factory<_i1064.LoginUseCase>(
      () => _i1064.LoginUseCase(authRepository: gh<_i487.AuthRepository>()),
    );
    gh.factory<_i32.RegisterUseCase>(
      () => _i32.RegisterUseCase(authRepository: gh<_i487.AuthRepository>()),
    );
    gh.factory<_i285.WeatherRepository>(
      () => _i665.WeatherRepositoryImpl(
        remoteDataSource: gh<_i872.WeatherRemoteDataSource>(),
      ),
    );
    gh.factory<_i715.PredictionRepository>(
      () => _i515.PredictionRepoImpl(
        predictionRemoteDataSource: gh<_i1036.PredictionRemoteDataSource>(),
      ),
    );
    gh.factory<_i415.GetPredictionUseCase>(
      () => _i415.GetPredictionUseCase(gh<_i715.PredictionRepository>()),
    );
    gh.factory<_i464.PredictionCubit>(
      () => _i464.PredictionCubit(gh<_i415.GetPredictionUseCase>()),
    );
    gh.factory<_i340.AuthCubit>(
      () => _i340.AuthCubit(
        gh<_i1064.LoginUseCase>(),
        gh<_i32.RegisterUseCase>(),
      ),
    );
    gh.factory<_i660.GetCurrentWeather>(
      () => _i660.GetCurrentWeather(repository: gh<_i285.WeatherRepository>()),
    );
    gh.factory<_i781.GetForecastWeather>(
      () => _i781.GetForecastWeather(repository: gh<_i285.WeatherRepository>()),
    );
    gh.factory<_i6.ForecastCubit>(
      () => _i6.ForecastCubit(gh<_i781.GetForecastWeather>()),
    );
    gh.factory<_i136.WeatherCubit>(
      () => _i136.WeatherCubit(
        getCurrentWeather: gh<_i660.GetCurrentWeather>(),
        getForecastWeather: gh<_i781.GetForecastWeather>(),
      ),
    );
    return this;
  }
}
