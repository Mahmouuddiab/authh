import 'package:authh/core/Api/dio_helper.dart';
import 'package:authh/features/prediction/data/data_source/prediction_remote_data_source.dart';
import 'package:authh/features/prediction/data/model/prediction_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:PredictionRemoteDataSource)
class PredictionRemoteDataSourceImpl implements PredictionRemoteDataSource{
  @override
  Future<PredictionModel> getPrediction(String city)async{
    final response=await DioHelper.getData(
        url: "http://10.0.2.2:5000/predict",
      queryParameters: {"city":city}
    );
    return response.data ;
  }
  
}