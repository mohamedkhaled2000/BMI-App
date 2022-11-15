import 'package:bmi_app/Home.dart';
import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isSwitch = false;

  get themMode {
    var them;
    if (isSwitch) {
      them = ThemeMode.dark;
    } else {
      them = ThemeMode.light;
    }
    return them;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themMode,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: const TextTheme(
          headline4: TextStyle(
            wordSpacing: 10,
            height: 2
          )
        ),
        iconTheme: const IconThemeData(color: Colors.white,size: 70)
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          headline4: TextStyle(
            wordSpacing: 10,
            height: 2
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white,size: 70)
        ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Body Mass Index"),
          centerTitle: true,
          actions: [
            Switch(
                value: isSwitch,
                onChanged: (val) {
                  setState(() {
                    isSwitch = val;
                  });
                })
          ],
        ),
        body: const MyHomePage(),
      ),
    );
  }
}
