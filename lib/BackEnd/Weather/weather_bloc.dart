import 'weather.dart';
import 'weather_event.dart';
import 'weather_service.dart';
import 'weather_state.dart';
import 'package:bloc/bloc.dart';
WeatherState state = WeatherLoadFailure();
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String cityName;

  WeatherBloc(this.cityName) : super(state){
    on<WeatherRequested>((handler, emit) async* {
      yield WeatherLoadInProgress();
      try {
        final Weather weather =
        await WeatherService.fetchCurrentWeather(query: handler.city);
        yield WeatherLoadSuccess(
            weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      };
    }
    );
    add(WeatherRequested(city: cityName));
  }


}
