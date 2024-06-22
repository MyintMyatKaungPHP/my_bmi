import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

Widget buildSliderContainer(String label, double value, WeightSliderController controller, Function(double) onChanged) {
  return Expanded(
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
            Text(label),
            Container(
              height: 80.0,
              alignment: Alignment.center,
              child: Text(
                value.toStringAsFixed(0),
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            VerticalWeightSlider(
              haptic: Haptic.lightImpact,
              height: 200,
              controller: controller,
              decoration: const PointerDecoration(
                width: 130.0,
                height: 5.0,
                largeColor: Colors.grey,
                mediumColor: Colors.grey,
                smallColor: Colors.grey,
                gap: 50.0,
              ),
              onChanged: onChanged,
              indicator: Container(
                height: 5.0,
                width: 230.0,
                alignment: Alignment.center,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
