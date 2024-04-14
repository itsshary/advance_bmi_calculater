import 'package:advance_bmi_calculater/provider/app_provider.dart';
import 'package:advance_bmi_calculater/widgets/calculate_button.dart';
import 'package:advance_bmi_calculater/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final myprovider = Provider.of<Appproviderclass>(context);
    return Scaffold(
        bottomSheet: InkWell(
            onTap: () async {
              myprovider.calculateBmi();
              await _alertDialogBox();
            },
            child: const CalculateButton()),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'BMI CALCULATER',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                      childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            myprovider.selectedGenderFun(0);
                          },
                          icon: Icon(
                            Icons.male,
                            size: 60,
                            color: myprovider.selectedGender == 0
                                ? Colors.red
                                : Colors.white,
                          )),
                      const Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      )
                    ],
                  )),
                  CustomWidget(
                      childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            myprovider.selectedGenderFun(1);
                          },
                          icon: Icon(
                            Icons.female,
                            size: 60,
                            color: myprovider.selectedGender == 1
                                ? Colors.red
                                : Colors.white,
                          )),
                      const Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      )
                    ],
                  )),
                ],
              ),
              const SizedBox(height: 10),
              CustomWidget(
                height: 150,
                width: 320,
                childwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Height'),
                    Slider(
                      value: myprovider.height.toDouble(),
                      activeColor: Colors.red,
                      min: 0,
                      max: 300,
                      divisions: 300,
                      onChanged: (value) {
                        myprovider.heightFun(value.toInt());
                      },
                    ),
                    Text('${myprovider.height}cm')
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomWidget(
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          '${myprovider.weight.toString()}kg',
                          style: const TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                  onPressed: () {
                                    myprovider.incrementWeight();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    weight: 70,
                                  )),
                            ),
                            CircleAvatar(
                              radius: 23,
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                onPressed: () {
                                  if (myprovider.weight > 1) {
                                    myprovider.dicrementWeight();
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  weight: 70,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomWidget(
                      childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Age',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      Text(
                        myprovider.age.toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.grey,
                            child: IconButton(
                                onPressed: () {
                                  myprovider.incrementAge();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  weight: 70,
                                )),
                          ),
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.grey,
                            child: IconButton(
                                onPressed: () {
                                  if (myprovider.age > 1) {
                                    myprovider.dicrementAge();
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  weight: 70,
                                )),
                          )
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ],
          ),
        ));
  }

  _alertDialogBox() {
    final myprovider = Provider.of<Appproviderclass>(context, listen: false);
    return showDialog(
      context: context,
      builder: (context) {
        Color? backgroundColor;

        // Determine background color based on BMI result
        if (myprovider.bmiResult <= 18.5) {
          backgroundColor = const Color.fromARGB(218, 248, 232, 183);
        } else if (myprovider.bmiResult >= 18.5 &&
            myprovider.bmiResult <= 24.9) {
          // Normal weight: Green
          backgroundColor = Colors.green;
        } else if (myprovider.bmiResult >= 25.0 &&
            myprovider.bmiResult <= 39.9) {
          // Overweight: Red
          backgroundColor = const Color.fromARGB(255, 255, 206, 59);
        } else if (myprovider.bmiResult > 40.0) {
          backgroundColor = Colors.red;
        }
        return AlertDialog(
          backgroundColor: backgroundColor,
          title:
              const Text('BMI Result', style: TextStyle(color: Colors.black)),
          content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: [
                  myprovider.selectedGender == 0
                      ? const Text('Your Gender is Male',
                          style: TextStyle(color: Colors.black))
                      : const Text('Your Gender is Female',
                          style: TextStyle(color: Colors.black)),
                  Text(
                    'Your Height is ${myprovider.height}cm',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text('Your Weight is ${myprovider.weight}kg',
                      style: const TextStyle(color: Colors.black)),
                  Text('Your Age is ${myprovider.age}',
                      style: const TextStyle(color: Colors.black)),
                  Text(
                    'Your BMI is ${myprovider.bmiResult.toStringAsFixed(2)},',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              )),
        );
      },
    );
  }
}
