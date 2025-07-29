import 'package:authh/core/Api/dio_helper.dart';
import 'package:authh/core/exceptions/exceptions.dart';
import 'package:authh/features/weather/data/data_source/weather_remote_data_source.dart';
import 'package:authh/features/weather/data/model/ForecastModel.dart';
import 'package:authh/features/weather/data/model/WeatherModel.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource{
  final String apiKey = '0045fad517524e2880801243251307';
  final String baseUrl = 'https://api.weatherapi.com/v1';
  @override
  Future<WeatherModel> getCurrentWeather(String cityName)async{
    try {
      var response= await DioHelper.getData(url:"$baseUrl/current.json?q=$cityName&key=$apiKey");

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw ServerException('Failed to load weather: ${response.statusCode}');
      }
    }
    on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(e.response?.data['error']['message'] ?? 'Server error');
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException('No internet connection');
      } else {
        throw ServerException('Failed to load weather: ${e.message}');
      }
    } catch (e) {
      throw ServerException('An unexpected error occurred: $e');
    }
  }

  @override
  Future<List<ForecastModel>> getForecastWeather(String cityName)async{
    try {
      var response= await DioHelper.getData(url: "$baseUrl/v1/forecast.json?q=$cityName&key=$apiKey&days=4&hour=24");
      if (response.statusCode == 200) {
        final List forecasts = response.data['forecast']['forecastday'];
        return forecasts.map((e) => ForecastModel.fromJson(e)).toList();
      } else {
        throw ServerException('Failed to load weather: ${response.statusCode}');
      }
    }
    on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(e.response?.data['error']['message'] ?? 'Server error');
      } else if (e.type == DioExceptionType.connectionError) {
        throw NetworkException('No internet connection');
      } else {
        throw ServerException('Failed to load weather: ${e.message}');
      }
    } catch (e) {
      throw ServerException('An unexpected error occurred: $e');
    }

  }

  @override
  Future<int?> getPrediction(List<int> features)async{
    try{
      final response= await DioHelper.postData(
          url: "http://192.168.1.9:5001/predict",
          data: {"features":features}
      );
      if(response.statusCode==200){
        final data=response.data;
        return data['prediction'] ;
      }
      else{
        print('Error: ${response.data}');
        return null;
      }
    }catch(e){
      print('Exception: $e');
      return null;
    }
  }


  }
