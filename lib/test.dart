import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

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
  double _age = 16.0;


  @override
  void initState() {
    super.initState();
    _weightController = WeightSliderController(initialWeight: _weight, minWeight: 20, interval: 1.0);
    _heightController = WeightSliderController(initialWeight: _height, minWeight: 120, interval: 1.0);
    _ageController = WeightSliderController(initialWeight: _age, minWeight: 1, interval: 1.0);
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
              child:
              Text('Select Information',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
              ),
            ),
          ),

        ),
        Expanded(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('MALE',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Icon(Icons.male, size: 90,)
                        ],
                      ),
                    ),
                  )
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('FEMALE',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.female, size: 90,)
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
        Expanded(
          flex: 7,
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT'),
                            Container(
                              height: 200.0,
                              alignment: Alignment.center,
                              child: Text(
                                "${_weight.toStringAsFixed(0)} kg",
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                              ),
                            ),
                            VerticalWeightSlider(
                              controller: _weightController,
                              decoration: const PointerDecoration(
                                width: 130.0,
                                height: 5.0,
                                largeColor: Colors.green,
                                mediumColor: Colors.grey,
                                smallColor: Colors.grey,
                                gap: 50.0,
                              ),
                              onChanged: (double value) {
                                setState(() {
                                  _weight = value;
                                });
                              },
                              indicator: Container(
                                height: 5.0,
                                width: 230.0,
                                alignment: Alignment.center,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('HEIGHT'),
                            Container(
                              height: 200.0,
                              alignment: Alignment.center,
                              child: Text(
                                "${_height.toStringAsFixed(0)} cm",
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                              ),
                            ),
                            VerticalWeightSlider(
                              controller: _heightController,
                              decoration: const PointerDecoration(
                                width: 130.0,
                                height: 5.0,
                                largeColor: Colors.green,
                                mediumColor: Colors.grey,
                                smallColor: Colors.grey,
                                gap: 50.0,
                              ),
                              onChanged: (double value) {
                                setState(() {
                                  _height = value;
                                });
                              },
                              indicator: Container(
                                height: 5.0,
                                width: 230.0,
                                alignment: Alignment.center,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE'),
                            Container(
                              height: 200.0,
                              alignment: Alignment.center,
                              child: Text(
                                "${_age.toStringAsFixed(0)}",
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                              ),
                            ),
                            VerticalWeightSlider(
                              controller: _ageController,
                              decoration: const PointerDecoration(
                                width: 130.0,
                                height: 5.0,
                                largeColor: Colors.green,
                                mediumColor: Colors.grey,
                                smallColor: Colors.grey,
                                gap: 50.0,
                              ),
                              onChanged: (double value) {
                                setState(() {
                                  _age = value;
                                });
                              },
                              indicator: Container(
                                height: 5.0,
                                width: 230.0,
                                alignment: Alignment.center,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: (){},
            child: Text('Calculate',style: TextStyle(color: Colors.white, fontSize: 20),),
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
