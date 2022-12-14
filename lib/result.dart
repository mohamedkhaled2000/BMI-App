import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result >= 25 && result < 30) {
      resultText = 'Overweight';
    } else if (result >= 18.5 && result < 24) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }

    return resultText;
  }

  var textStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: const Text('Result'),
            centerTitle: true,
            iconTheme: IconThemeData(size: 30),
          ),
          body:
        SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Gender: ${isMale ? "Male" : "Female"}',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Text(
          'Result: ${result.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Text(
          'Healthiness: ${resultPhrase}',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        Text(
          'Age: ${age}',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ],
    )))
    );
  }
}
