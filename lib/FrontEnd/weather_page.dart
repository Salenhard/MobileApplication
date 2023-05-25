import 'package:flutter/material.dart';
import '../BackEnd/Weather/weather_bloc.dart';
import '../BackEnd/Weather/weather_event.dart';
import '../BackEnd/Weather/weather_state.dart';
import 'weather_main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
@override
Widget build(BuildContext context) {
  return BlocProvider(
    create: (context) => WeatherBloc('Berlin'),
    child: BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadSuccess) {
          return Scaffold(
              body: Padding(
              padding: EdgeInsets.only(top: 64),
              child: MainScreenWrapper(
                  weather: state.weather),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    ),
  );
}
}