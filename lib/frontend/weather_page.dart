import 'package:flutter/material.dart';
import 'package:untitled4/Other/extensions.dart';
import 'package:untitled4/backend/weather/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  var _isLoading = false;
  String? _weather;
  dynamic _error;
  final apiKey = "580ff41b3ddf7ac053c01eec94985f50";

  late AnimationController _scaleAnimationController;
  late Animation<double> _scaleAnimation;

  final _containerMargin =
      const EdgeInsets.symmetric(horizontal: 16, vertical: 32);

  @override
  void initState() {
    super.initState();
    _scaleAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _scaleAnimation = CurvedAnimation(
        parent: _scaleAnimationController, curve: Curves.easeIn);

    _scaleAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    super.dispose();
  }

  void _examineWeather() async {
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
      _error = _weather = null;
    });

    void onError(Object e) {
      setState(() {
        _isLoading = false;
        _error = e;
        _weather = null;
      });
    }

    try {
      _weather = await Weather.weather(onError: onError);

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      onError(e);

      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(Extensions.getSnackBar(e.toString()));
      });
    }
  }

  Widget get _responce {
    const noWeather = "All is fine, just info is empty";

    if (_isLoading) {
      return ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: _containerMargin,
          child: const FittedBox(
            child: Text(
              "Check out the weather...",
              style: Extensions.textStyleMainField1,
              textScaleFactor: 5,
            ),
          ),
        ),
      );
    } else if ((_error != null) || (_weather != null && _weather!.isEmpty)) {
      return Container(
        margin: _containerMargin,
        child: FittedBox(
          child: Text(
            "Ops! Something gone wrong...\nError: ${_error ?? noWeather}",
            style: Extensions.textStyleMainField1,
            textScaleFactor: 5,
          ),
        ),
      );
    } else if (_weather != null) {
      return Container(
        margin: _containerMargin,
        child: FittedBox(
          child: Text(
            _weather!,
            style: Extensions.textStyleMainField1,
            textScaleFactor: 5,
          ),
        ),
      );
    }

    return Container(
      margin: _containerMargin,
      child: const FittedBox(
        child: Text(
          "Interesting.. what's weather?..",
          style: Extensions.textStyleMainField1,
          textScaleFactor: 5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Extensions.getAppBarUsual1("Weather."),
        backgroundColor: Extensions.colorDark,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _responce,
            ElevatedButton(
                style: Extensions.buttonElevatedStyleUsual1,
                onPressed: _examineWeather,
                child: const Text(
                  "Click to check the weather outside",
                  style: Extensions.textStyleMainField1,
                ))
          ],
        ));
  }
}
