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

import '../../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i643;
import '../../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i212;
import '../../../features/auth/data/reopsitory/auth_repository_impl.dart'
    as _i359;
import '../../../features/auth/domain/repository/auth_repository.dart' as _i754;
import '../../../features/auth/domain/usecase/login_usecase.dart' as _i75;
import '../../../features/auth/domain/usecase/register_usecase.dart' as _i783;
import '../../../features/auth/presenation/bloc/auth_cubit.dart' as _i115;
import '../../../features/prediction/data/data_source/prediction_remote_data_source.dart'
    as _i483;
import '../../../features/prediction/data/data_source/prediction_remote_data_source_impl.dart'
    as _i748;
import '../../../features/prediction/data/repo/prediction_repo_impl.dart'
    as _i815;
import '../../../features/prediction/domain/repositories/prediction_repository.dart'
    as _i191;
import '../../../features/prediction/domain/usecases/get_prediction_usecase.dart'
    as _i625;
import '../../../features/prediction/presentation/bloc/prediction_cubit.dart'
    as _i101;
import '../../../features/weather/data/data_source/weather_remote_data_source.dart'
    as _i664;
import '../../../features/weather/data/data_source/weather_remote_data_source_impl.dart'
    as _i886;
import '../../../features/weather/data/repository/weather_repository_impl.dart'
    as _i960;
import '../../../features/weather/domain/repository/weather_repository.dart'
    as _i752;
import '../../../features/weather/domain/usecase/get_current_weather.dart'
    as _i961;
import '../../../features/weather/domain/usecase/get_forecast_weather.dart'
    as _i359;
import '../../../features/weather/presentation/bloc/forecast_bloc.dart'
    as _i1070;
import '../../../features/weather/presentation/bloc/weather_bloc.dart'
    as _i1001;
import '../../Api/dio_helper.dart' as _i1032;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1032.DioHelper>(() => _i1032.DioHelper());
    gh.factory<_i643.AuthRemoteDataSource>(
      () => _i212.AuthRemoteDataSourceImpl(),
    );
    gh.factory<_i664.WeatherRemoteDataSource>(
      () => _i886.WeatherRemoteDataSourceImpl(),
    );
    gh.factory<_i754.AuthRepository>(
      () => _i359.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i643.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i483.PredictionRemoteDataSource>(
      () => _i748.PredictionRemoteDataSourceImpl(),
    );
    gh.factory<_i75.LoginUseCase>(
      () => _i75.LoginUseCase(authRepository: gh<_i754.AuthRepository>()),
    );
    gh.factory<_i783.RegisterUseCase>(
      () => _i783.RegisterUseCase(authRepository: gh<_i754.AuthRepository>()),
    );
    gh.factory<_i752.WeatherRepository>(
      () => _i960.WeatherRepositoryImpl(
        remoteDataSource: gh<_i664.WeatherRemoteDataSource>(),
      ),
    );
    gh.factory<_i191.PredictionRepository>(
      () => _i815.PredictionRepoImpl(
        predictionRemoteDataSource: gh<_i483.PredictionRemoteDataSource>(),
      ),
    );
    gh.factory<_i625.GetPredictionUseCase>(
      () => _i625.GetPredictionUseCase(gh<_i191.PredictionRepository>()),
    );
    gh.factory<_i101.PredictionCubit>(
      () => _i101.PredictionCubit(gh<_i625.GetPredictionUseCase>()),
    );
    gh.factory<_i115.AuthCubit>(
      () =>
          _i115.AuthCubit(gh<_i75.LoginUseCase>(), gh<_i783.RegisterUseCase>()),
    );
    gh.factory<_i961.GetCurrentWeather>(
      () => _i961.GetCurrentWeather(repository: gh<_i752.WeatherRepository>()),
    );
    gh.factory<_i359.GetForecastWeather>(
      () => _i359.GetForecastWeather(repository: gh<_i752.WeatherRepository>()),
    );
    gh.factory<_i1070.ForecastCubit>(
      () => _i1070.ForecastCubit(gh<_i359.GetForecastWeather>()),
    );
    gh.factory<_i1001.WeatherCubit>(
      () => _i1001.WeatherCubit(
        getCurrentWeather: gh<_i961.GetCurrentWeather>(),
        getForecastWeather: gh<_i359.GetForecastWeather>(),
      ),
    );
    return this;
  }
}
