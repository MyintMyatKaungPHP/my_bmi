import 'package:flutter/material.dart';

Widget buildGenderSelection(String gender, IconData icon, String? selectedGender, Function(String) onTap) {
  bool isSelected = selectedGender == gender;
  return Expanded(
    child: GestureDetector(
      onTap: () => onTap(gender),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0x3000FF00) : Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              gender,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Icon(icon, size: 40),
          ],
        ),
      ),
    ),
  );
}