import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmi = 0;
  String _bmiResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 130,
              child: TextField(
                controller: _heightController,
                style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Height',
                    hintStyle: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(0.6),
                    )),
              ),
            ),
            Container(
              width: 130,
              child: TextField(
                controller: _weightController,
                style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Weight',
                    hintStyle: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(0.6),
                    )),
              ),
            ),
          ]),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _bmi = double.parse(_weightController.text) /
                    (double.parse(_heightController.text) *
                        double.parse(_heightController.text));
                if (_bmi < 18.5) {
                  _bmiResult = 'Underweight';
                } else if (_bmi >= 18.5 && _bmi <= 24.9) {
                  _bmiResult = 'Normal';
                } else if (_bmi >= 25 && _bmi <= 29.9) {
                  _bmiResult = 'Overweight';
                } else if (_bmi >= 30) {
                  _bmiResult = 'Obese';
                }
              });
            },
            child: const Text(
              'Calculate',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              _bmi.toStringAsFixed(2),
              style: const TextStyle(fontSize: 90, color: accentHexColor),
            ),
          ),
          Container(
            child: Text(
              _bmiResult,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const RightBar(barWidth: 40),
          const SizedBox(
            height: 10,
          ),
          const RightBar(barWidth: 80),
          const SizedBox(
            height: 10,
          ),
          const RightBar(barWidth: 40),
          const SizedBox(
            height: 10,
          ),
          const LeftBar(barWidth: 80),
          const SizedBox(
            height: 10,
          ),
          const LeftBar(barWidth: 40),
          const SizedBox(
            height: 10,
          ),
          const LeftBar(barWidth: 80),
        ],
      ),
    );
  }
}
