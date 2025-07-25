import 'package:authh/core/di/di.dart';
import 'package:authh/core/widgets/app_button.dart';
import 'package:authh/core/widgets/custom_field.dart';
import 'package:authh/features/prediction/presentation/bloc/prediction_cubit.dart';
import 'package:authh/features/prediction/presentation/bloc/prediction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PredictionScreen extends StatelessWidget {
  final cityController = TextEditingController();
  final PredictionCubit predictionCubit=getIt<PredictionCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Predictor')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          children: [
            CustomField(
                hint: "cityName",
                obscureText: false,
              controller: cityController,
              keyboardType: TextInputType.text,
              filled: true,
            ),
            AppButton(
                onPressed: (){
                  predictionCubit.fetchPrediction(cityController.text);
                },
                child: Text("predict")
            ),
            BlocBuilder<PredictionCubit,PredictionState>(
                bloc: predictionCubit,
                builder: (context, state) {
                  if (state is PredictionLoading){
                    return CircularProgressIndicator();
                  }
                  else if(state is PredictionLoaded){
                    return Column(
                      children: [
                        Text('City: ${state.model.city}'),
                        Text('Temp: ${state.model.temp} °C'),
                        Text('Humidity: ${state.model.humidity} %'),
                        Text('Wind: ${state.model.wind} kph'),
                        Text('Prediction: ${state.model.prediction}'),
                      ],
                    ) ;
                  }
                  else if(state is PredictionError){
                    return Center(child: Text("Error"),) ;
                  }
                  return SizedBox.shrink() ;
                },
            ),
          ],
        ),
      ),
      
    );
  }
}
