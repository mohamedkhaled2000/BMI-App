import 'dart:math';

import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isMale = true;
  double heightVal = 170.0;
  var age = 20;
  var weight = 70;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                GenderExpand(context, 'male'),
                GenderExpand(context, 'female'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(heightVal.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.center,
                        ),
                        Text("CM",
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),

                      ],
                    ),
                    Slider(
                        min: 50,
                        max: 250,
                        value: heightVal,
                        onChanged: ((value) {
                          setState(() {
                            heightVal = value;
                          });
                        }))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                InfoExpand(context, 'weight'),
                InfoExpand(context, 'age'),
              ],
            ),
          ),
          Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                  onPressed: (() {
                    var result = weight / pow(heightVal / 100, 2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Result(
                                result: result, isMale: isMale, age: age)));
                  }),
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.headline5,
                  )))
        ],
      ),
    );
  }

  Expanded GenderExpand(BuildContext context, type) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: (() {
            setState(() {
              isMale = type == 'male' ? true : false;
            });
          }),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    (isMale && type == 'male') || (!isMale && type == 'female')
                        ? Colors.teal
                        : Colors.blueGrey),
            child: Column(
              children: <Widget>[
                type == 'male' ? Icon(Icons.male) : Icon(Icons.female),
                Text(
                  type == 'male' ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded InfoExpand(BuildContext context, type) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
          child: Column(
            children: <Widget>[
              Text(
                type == 'weight' ? 'Weight' : 'Age',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                type == 'weight' ? '$weight' : '$age',
                style: Theme.of(context).textTheme.headline2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      elevation: 20,
                      backgroundColor: Colors.teal,
                      heroTag: type == 'weight' ? 'weight--' : 'age--',
                      onPressed: () {
                        setState(() {
                          type == 'weight' ? weight-- : age--;
                        });
                      },
                      child: Icon(Icons.remove),
                      mini: true,
                    ),
                  ),
                  FloatingActionButton(
                    elevation: 20,
                    backgroundColor: Colors.teal,
                    heroTag: type == 'weight' ? 'weight++' : 'age++',
                    onPressed: () {
                      setState(() {
                        type == 'weight' ? weight++ : age++;
                      });
                    },
                    child: Icon(Icons.add),
                    mini: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
