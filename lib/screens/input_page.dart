import 'package:flutter/material.dart';
import 'package:my_bmi/components/bmi_calculator.dart';
import 'package:my_bmi/components/buildGenderSelection.dart';
import 'package:my_bmi/components/buildSliderContainer.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';// Import the BMI calculator

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late WeightSliderController _weightController;
  late WeightSliderController _heightController;
  late WeightSliderController _ageController;
  double _weight = 55.0;
  double _height = 155.0;
  double _age = 15.0;
  String? _selectedGender;
  String _bmiResult = 'Select Information';
  String _bmiCategory = '';
  String _suggestion = '';

  @override
  void initState() {
    super.initState();
    _weightController = WeightSliderController(initialWeight: _weight, minWeight: 20, interval: 1.0);
    _heightController = WeightSliderController(initialWeight: _height, minWeight: 120, interval: 1.0, maxWeight: 240);
    _ageController = WeightSliderController(initialWeight: _age, minWeight: 1, interval: 1.0, maxWeight: 110);
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void calculateBmi() {
    if (_selectedGender == null) {
      setState(() {
        _bmiResult = 'Please select a gender';
      });
      return;
    }
    final result = calculateBmiAndSuggest(_selectedGender!, _weight, _height, _age.toInt());
    setState(() {
      _bmiResult = 'Your BMI is ${result['bmi'].toStringAsFixed(1)}';
      _bmiCategory = '${result['bmiCategory']}';
      _suggestion = '${result['suggestion']}';
    });
  }

  Color getBmiCategoryColor(String bmiCategory) {
    switch (bmiCategory) {
      case 'Underweight':
        return Colors.blue;
      case 'Normal weight':
        return Colors.green;
      case 'Overweight':
        return Colors.orange;
      case 'Obesity':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 15),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildGenderSelection('MALE', Icons.male, _selectedGender, (String gender) {
                setState(() {
                  _selectedGender = gender;
                });
              }),
              buildGenderSelection('FEMALE', Icons.female, _selectedGender, (String gender) {
                setState(() {
                  _selectedGender = gender;
                });
              }),
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildSliderContainer('WEIGHT (kg)', _weight, _weightController, (double newValue) {
                setState(() {
                  _weight = newValue;
                });
              }),
              buildSliderContainer('HEIGHT (cm)', _height, _heightController, (double newValue) {
                setState(() {
                  _height = newValue;
                });
              }),
              buildSliderContainer('AGE', _age, _ageController, (double newValue) {
                setState(() {
                  _age = newValue;
                });
              }),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: TextButton(
              onPressed: calculateBmi,
              child: Text(
                'Calculate',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(_bmiResult, style: TextStyle(fontSize: 24)),
                Text(
                  _bmiCategory,
                  style: TextStyle(
                    fontSize: 20,
                    color: getBmiCategoryColor(_bmiCategory),
                  ),
                ),
                Text(_suggestion, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
